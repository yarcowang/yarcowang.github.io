/**
 * Vi Key Binding
 *
 * reimplemented in MVC style
 * 
 * @author Yarco<yco_w@me.com>
 * @license NEWBSD
 * @date 2012/09/01
 */
var vikb = {
	// utilities
	'extend': function(a, b, c) {
		var r = a;
		for(var i in b) {
			r[i] = typeof c == 'undefined' || typeof c[i] == 'undefined' ? b[i] : c[i];
		}
		return r;
	},

	// module
	'module': function(controller) {
		this.controller = controller;
		this._lb = [];
		this._le = [];

		var self = this;

		// valid
		this.valid = function(pos) {
			for(var i = 0; i < self._le.length; i++) {
				if (pos == self._le[i]) {
					return i ?
						(self._le[i - 1] + 1 == self._le[i] ?
							pos :
							pos - 1) :
						(self._le[i] == 0 ?
							0 :
							pos - 1);
				}
			}
			return pos;
		};

		// find the lineno: from 0
		this.lineno = function(pos) {
			for(var i = 0; i < self._le.length; i++) {
				if (pos <= self._le[i]) {
					if (self.controller._d) console.log('pos to lineno: ' + pos + ' --> ' + i);
					return i;
				}
			}
			if (self.controller._d) console.log('unknown pos: ' + pos);
			return 0;
		};

		// initialize
		this.init = function(text, settings) {
			// detect line ending
			for(var i = 0; (i = text.indexOf("\n", i)) != -1; i++) {
				self._le.push(i);
			}
			if (text.charAt(text.length - 1) != "\n") {
				self._le.push(text.length); // EOF
			}
			if (self.controller._d) console.log('line ending: ' + self._le);

			// detect line beginning
			for(var l = r = 0, i = 0; i < self._le.length; i++) {
				r = self._le[i];
				self._lb.push(r - text.substring(l, r).trimLeft().length);
				l = r + 1;
			}
			if (self.controller._d) console.log('line begining: ' + self._lb);

			// TODO: maybe other
			return self;
		};

		// move left
		this.left = function(pos, n) {
			var lineno = self.lineno(pos);
			return !lineno ?
				(pos - n > 0 ? pos - n : 0) :
				(pos - n > self._le[lineno - 1] ? pos - n : self._le[lineno - 1] + 1);
		};
		// move right
		this.right = function(pos, n, flag) {
			var lineno = self.lineno(pos);
			return pos + n >= self._le[lineno] ? (flag ? self._le[lineno] : self._le[lineno] - 1) : pos + n;
		};
		// move to line beginning
		this.linebegin = function(pos) {
			var lineno = self.lineno(pos);
			return lineno ? self._le[lineno - 1] + 1 : 0;
		};
		// move to line beginning non-blank
		this.linebegin_nonblank = function(pos) {
			var lineno = self.lineno(pos);
			return self._lb[lineno];
		};
		// move to line ending
		this.lineend = function(pos, n, flag) {
			var lineno = self.lineno(pos);
			n--;
			lineno += n;
			return lineno > self._le.length - 1 ? (flag ? self._le[self._le.length - 1] : self._le[self._le.length - 1] - 1) : (flag ? self._le[lineno] : self._le[lineno] - 1);
		};

		// move up n line
		this.upline = function(pos, n) {
			var lineno = self.lineno(pos);
			if (!lineno) return pos; // first line
			
			var offset = pos - self._le[lineno - 1];
			lineno = lineno - n > 0 ? lineno - n : 0;
			return lineno ?
				(self._le[lineno - 1] + offset > self._le[lineno] ?
					(self._le[lineno - 1] + 1 == self._le[lineno] ?
						self._le[lineno] :
						self._le[lineno] - 1) :
					(self._le[lineno - 1] + offset == self._le[lineno] ?
						(self._le[lineno - 1] + 1 == self._le[lineno] ?
							self._le[lineno] :
							self._le[lineno] - 1) :
						self._le[lineno - 1] + offset)) :
				(offset > self._le[0] ?
					(self._le[0] == 0 ?
						0 :
						self._le[0] - 1) :
					(offset == self._le[0] ?
						(self._le[0] == 0 ?
							0 :
							self._le[0] - 1) :
						offset));
		};
		// move down n line
		this.downline = function(pos, n) {
			var lineno = self.lineno(pos);
			if (lineno == self._le.length - 1) return pos; // last line 

			var offset = lineno ?
				pos - self._le[lineno - 1] :
				pos;
			lineno = lineno + n > self._le.length - 1 ? self._le.length - 1 : lineno + n;
			return self._le[lineno - 1] + offset >= self._le[lineno] ?
				(self._le[lineno - 1] + 1 == self._le[lineno] ?
					self._le[lineno] :
					self._le[lineno] - 1) :
				self._le[lineno - 1] + offset;
		};
		// go to line no
		this.gotoline = function(pos, n, flag) {
			if (n && n > self._le.length) n = self._le.length;
			if (!n) {
				n = flag ? self._le.length : 1;
			}
			n--; // internal lineno
			
			var lineno = self.lineno(pos);
			var offset = lineno ? pos - self._le[lineno - 1] : pos;
			return n ?
				(self._le[n - 1] + offset >=  self._le[n] ?
					(self._le[n - 1] + 1 == self._le[n] ?
						self._le[n] :
						self._le[n] - 1) :
					self._le[n - 1] + offset) :
				(offset >= self._le[0] ?
					(self._le[0] == 0 ?
						0 :
						self._le[0] - 1) :
					offset);
		};
		// go to N percent line
		this.gotopercent = function(pos, n) {
			if (n > 100) n = 100;
			var n = parseInt((self._le.length - 1) * n / 100, 10);
			var lineno = self.lineno(pos);
			var offset = lineno ? pos - self._le[lineno - 1] : pos;
			return n ?
				(self._le[n - 1] + offset >=  self._le[n] ?
					(self._le[n - 1] + 1 == self._le[n] ?
						self._le[n] :
						self._le[n] - 1) :
					self._le[n - 1] + offset) :
				(offset >= self._le[0] ?
					(self._le[0] == 0 ?
						0 :
						self._le[0] - 1) :
					offset);
		};

		// get new line pos for pos
		this.newline = function(pos, flag) { // false for beginning
			for(var i = 0; i < self._le.length; i++) {
				if (pos <= self._le[i]) {
					return flag ?
						(i ? self._le[i] + 1 : 0) :
						(i ? self._le[i - 1] + 1 : self._le[0] + 1);
				}
			}
			return 0;
		};
	},

	// view
	'view': function(controller) {
		this.controller = controller;
		this._t = null;

		var self = this;

		// pos
		this.pos = function(item) {
			// TODO: compatibility
			return item.selectionStart || item.selectionStart == '0' ? item.selectionStart : 0;
		};

		// range
		this.range = function(item, pos, len) {
			// TODO: compatibility
			item.setSelectionRange(pos, pos + len);
		};

		// initialize
		this.init = function(item, settings) {
			self._t = item;	
			self._s = settings;
			self._c = self._t.style.backgroundColor;

			self._t.style.backgroundColor = settings.color;
			self.range(item, self.pos(item), 1);
			self._t.addEventListener('blur', self.quit, false);
			return self;
		};

		this.quit = function() {
			self._t.style.backgroundColor = self._c;
			self.range(self._t, self.pos(self._t), 0);
			self._t.removeEventListener('blur', self.quit, false);
			self.controller._s.mode = 'insert';
		};

		this.addline = function(item, pos) {
			var text = item.value;
			item.value = text.substring(0, pos) + "\n" + text.substring(pos);
		};

		this.remove = function(item, pos1, pos2) {
			var text = item.value;
			var left = pos1 == 0 ? '' : text.substring(0, pos1);
			var right = pos2 == text.length - 1 ? '' : text.substring(pos2 + 1);
			item.value = left + right;
		};
		this.removeeol = function(item, pos1, pos2) {
			var text = item.value;
			var left = pos1 == 0 ? '' : text.substring(0, pos1);
			var right = pos2 == text.length - 1 ? '' : text.substring(pos2 + 1);
			item.value = left + text.slice(pos1, pos2).replace(/\n/g, '') + right;
		};

		this.get = function(item, pos1, pos2) {
			var text = item.value;
			return text.substring(pos1, pos2 + 1);
		};

		this.paste = function(item, pos, txt, n, flag) {
			var text = item.value;
			var t = '';
			while (n--) {
				t += txt;
			}
			item.value = text.substring(0, pos) + t + text.substring(pos);
			return flag ? pos + t.length : pos;
		};
	},

	// controller
	'controller': function(settings) {
		this._d = false;
		this._s = {};
		this._c = '';

		this._m = {};
		this._v = {};

		// settings
		this.settings = vikb.extend({}, {
			color: 'lightgray'
		}, settings);

		var self = this;

		// debug
		this.debug = function() {
			self._d = !self._d;
			return self;
		};

		// main
		this.run = function() {
			var items = document.getElementsByTagName('textarea');
			for(var i = 0; i < items.length; i++) {
				if (items[i].style.display != 'none') {
					// TODO: compatibility
					items[i].onkeydown = self.keydown;
				}
			}
		};

		// dispatcher
		this.keydown = function(e) {
			// ignore keys
			if (e.which == 16 || e.which == 17 || e.which == 18 || e.which == 224) { // shift, ctrl, alt, command
				return;
			}

			if (e.which == 27) { // esc
				if (self._s.mode == 'normal') {
					return;
				}
				self._s.mode = 'normal';
				self._s.n = 0;
				self._s.c = '';
				if (self._d) console.log('enter mode: ' + self._s.mode);

				// initialize
				self._v = (new vikb.view(self)).init(e.target, self.settings);
				self._m = (new vikb.module(self)).init(e.target.value, self.settings);
				self._v.range(e.target,
					self._m.valid(self._v.pos(e.target)),
					1);
				return;
			}

			if (self._d) {
				console.log('keycode: ' + e.which);
				if (self._c) {
					console.log('cache: ' + self._c);
				}
			}

			if (self._s.mode == 'normal') {
				// number buffer
				if ((e.which > 48 || (parseInt(self._s.n, 10) && e.which == 48)) && e.which <= 57 && !e.shiftKey) { // number
					self._s.n += '' + (e.which - 48);
					if (self._d) console.log('number buff: ' + self._s.n);
					return false;
				}
				// command buffer	
				if ((e.which == 71 && !e.shiftKey && !self._s.c) || // g
						(e.which == 68 && !e.shiftKey && !self._s.c) || // d
						0
					) {
					self._s.c += String.fromCharCode((96 <= e.keyCode && e.keyCode <= 105) ? e.keyCode - 48 : e.keyCode).toLowerCase();
					if (self._d) console.log('command buff: ' + self._s.c);
					return false;
				}

				// * * * * Left-right motions * * * *
				if (e.which == 72 || e.which == 37) { // h, left
					self._v.range(e.target,
						self._m.left(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10)),
						1);
				} else
				if (e.which == 32 || e.which == 39 || e.which == 76) { // l, space, right
					self._v.range(e.target,
						self._m.right(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10), false),
						1);
				} else
				if (e.which == 48) { // 0
					self._v.range(e.target,
						self._m.linebegin(self._v.pos(e.target)),
						1);
				} else
				if (e.which == 54 && e.shiftKey) { // ^
					self._v.range(e.target,
						self._m.linebegin_nonblank(self._v.pos(e.target)),
						1);
				} else
				if (e.which == 52 && e.shiftKey) { // $
					self._v.range(e.target,
						self._m.lineend(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10), false),
						1);
				} else

				// * * * * Up-down motions * * * *
				if (e.which == 75 || e.which == 38) { // k, up
					self._v.range(e.target,
						self._m.upline(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10)),
						1);
				} else
				if ((e.which == 74 && !e.shiftKey) || e.which == 40) { // j, down
					self._v.range(e.target,
						self._m.downline(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10)),
						1);
				} else
				if (e.which == 173 && !e.shiftKey) { // -
					var pos = self._m.upline(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10));
					pos = self._m.linebegin_nonblank(pos);
					self._v.range(e.target, pos, 1);
				} else
				if (e.which == 61 && e.shiftKey) { // +
					var pos = self._m.downline(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10));
					pos = self._m.linebegin_nonblank(pos);
					self._v.range(e.target, pos, 1);
				} else
				if (e.which == 173 && e.shiftKey) { // _
					var pos = self._m.downline(self._v.pos(e.target), self._s.n == 0 ? 0 : parseInt(self._s.n, 10) - 1);
					pos = self._m.linebegin_nonblank(pos);
					self._v.range(e.target, pos, 1);
				} else
				if (e.which == 71 && e.shiftKey) { // G
					var pos = self._m.gotoline(self._v.pos(e.target), parseInt(self._s.n, 10), true);
					pos = self._m.linebegin_nonblank(pos);
					self._v.range(e.target, pos, 1);
				} else
				if (e.which == 71 && !e.shiftKey && self._s.c == 'g') { // gg
					var pos = self._m.gotoline(self._v.pos(e.target), parseInt(self._s.n, 10), false);
					pos = self._m.linebegin_nonblank(pos);
					self._v.range(e.target, pos, 1);
				} else
				if (e.which == 53 && e.shiftKey && self._s.n > 0) { // N %
					var pos = self._m.gotopercent(self._v.pos(e.target), parseInt(self._s.n, 10));
					pos = self._m.linebegin_nonblank(pos);
					self._v.range(e.target, pos, 1);
				} else

				// * * * * Inserting text * * * *
				if (e.which == 65 && !e.shiftKey) { // a
					var pos = self._m.right(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10) + 1, true);
					self._v.range(e.target, pos, 0);
					self._v.quit();
				} else
				if (e.which == 65 && e.shiftKey) { // A
					var pos = self._m.lineend(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10), true);
					self._v.range(e.target, pos, 0);
					self._v.quit();
				} else
				if (e.which == 73 && !e.shiftKey) { // i
					var pos = self._m.left(self._v.pos(e.target), self._s.n == 0 ? 0 : parseInt(self._s.n, 10));
					self._v.range(e.target, pos, 0);
					self._v.quit();
				} else
				if (e.which == 73 && e.shiftKey) { // I
					var pos = self._m.upline(self._v.pos(e.target), self._s.n == 0 ? 0 : parseInt(self._s.n, 10));
					pos = self._m.linebegin_nonblank(pos);
					self._v.range(e.target, pos, 0);
					self._v.quit();
				} else
				if (e.which == 79 && !e.shiftKey) { // o // TODO: some bugs
					var pos = self._m.downline(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10));
					pos = self._m.newline(pos, false);
					self._v.addline(e.target, pos);
					self._v.range(e.target, pos, 0);
					self._v.quit();
				} else
				if (e.which == 79 && e.shiftKey) { // O
					var pos = self._m.upline(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10));
					pos = self._m.newline(pos, true);
					self._v.addline(e.target, pos);
					self._v.range(e.target, pos, 0);
					self._v.quit();
				} else

				// * * * * Deleting text * * * *
				if (e.which == 88 && !e.shiftKey) { // x
					var pos1 = self._v.pos(e.target);
					var pos2 = self._m.right(pos1, self._s.n == 0 || self._s.n == 1 ? 0 : parseInt(self._s.n, 10) - 1, false);
					self._c = self._v.get(e.target, pos1, pos2); // cache
					self._v.remove(e.target, pos1, pos2);
					self._m = (new vikb.module(self)).init(e.target.value, self.settings); // reload
					self._v.range(e.target, self._m.valid(pos1), 1);
				} else
				if (e.which == 88 && e.shiftKey) { // X
					var pos1 = self._v.pos(e.target);
					var pos2 = self._m.left(self._v.pos(e.target), self._s.n == 0 || self._s.n == 1 ? 1 : parseInt(self._s.n, 10));
					self._c = self._v.get(e.target, pos2, pos1 - 1); // cache
					self._v.remove(e.target, pos2, pos1 - 1);
					self._m = (new vikb.module(self)).init(e.target.value, self.settings); // reload
					self._v.range(e.target, self._m.valid(pos2), 1);
				} else
				if (e.which == 68 && !e.shiftKey && self._s.c == 'd') { // dd // TODO: some bugs
					var pos0 = self._v.pos(e.target);
					var pos1 = self._m.linebegin(pos0);
					var pos2 = self._m.lineend(self._v.pos(e.target), self._s.n == 0 ? 1 : parseInt(self._s.n, 10), true);
					self._c = self._v.get(e.target, pos1, pos2); // cache
					self._v.remove(e.target, pos1, pos2);	
					self._m = (new vikb.module(self)).init(e.target.value, self.settings); // reload
					self._v.range(e.target, self._m.valid(pos0), 1);
				} else
				if (e.which == 68 && e.shiftKey) { // D
					var pos1 = self._v.pos(e.target);
					var pos2 = self._m.lineend(pos1, self._s.n == 0 ? 1 : parseInt(self._s.n, 10), false);
					self._c = self._v.get(e.target, pos1, pos2); // cache
					self._v.remove(e.target, pos1, pos2);
					self._m = (new vikb.module(self)).init(e.target.value, self.settings); // reload
					self._v.range(e.target, self._m.valid(pos1 - 1), 1);
				} else
				if (e.which == 74 && e.shiftKey) { // J
					var pos1 = self._v.pos(e.target);
					var pos2 = self._m.lineend(pos1, self._s.n == 0 ? 1 : parseInt(self._s.n, 10), true);
					self._c = self._v.get(e.target, pos1, pos2); // cache
					self._v.removeeol(e.target, pos1, pos2);
					self._m = (new vikb.module(self)).init(e.target.value, self.settings); // reload
					self._v.range(e.target, self._m.valid(pos1), 1);
				} else
				
				// * * * * Copying and moving text * * * *
				if (e.which == 80 && !e.shiftKey) { // p // TODO: some bugs
					var pos = self._v.pos(e.target);
					var n = self._s.n == 0 ? 1 : parseInt(self._s.n, 10);
					pos = self._v.paste(e.target, pos, self._c, n, true);
					self._m = (new vikb.module(self)).init(e.target.value, self.settings); // reload
					self._v.range(e.target, pos, 1);
				} else
				if (e.which == 80 && e.shiftKey) { // P
					var pos = self._v.pos(e.target);
					var n = self._s.n == 0 ? 1 : parseInt(self._s.n, 10);
					pos = self._v.paste(e.target, pos, self._c, n, false);
					self._m = (new vikb.module(self)).init(e.target.value, self.settings); // reload
					self._v.range(e.target, pos, 1);
				} else { // END HERE 
				}

				self._s.n = 0;
				self._s.c = '';
				return false;
			}
			
		};
	}
}

