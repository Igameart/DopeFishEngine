
// Generated at 2020-08-21 22:10:54 (259ms) for v2.3+
#region metatype
globalvar tex_std_haxe_type_markerValue; tex_std_haxe_type_markerValue = [];
globalvar mt_TexEntry; mt_TexEntry = new tex_std_haxe_class(-1, "TexEntry");
globalvar mt_TexPage; mt_TexPage = new tex_std_haxe_class(-1, "TexPage");
globalvar mt_TexSprite; mt_TexSprite = new tex_std_haxe_class(-1, "TexSprite");
globalvar mt_tex_std_haxe_class; mt_tex_std_haxe_class = new tex_std_haxe_class(-1, "tex_std_haxe_class");
#endregion

#region TexEntry

globalvar TexEntry; TexEntry = method(undefined, function(_x, _y, _w, _h) constructor {
	/// TexEntry(x:real, y:real, w:real, h:real)
	/// @param {real} x
	/// @param {real} y
	/// @param {real} w
	/// @param {real} h
	static left = undefined;
	static top = undefined;
	static width = undefined;
	static height = undefined;
	static xoffset = undefined;
	static yoffset = undefined;
	static nodeA = undefined;
	static nodeB = undefined;
	static add = function(_imgWidth, _imgHeight) {
		var _stack = TexEntry.insertStack;
		ds_stack_clear(_stack);
		ds_stack_push(_stack, self);
		while (!ds_stack_empty(_stack)) {
			var _e = ds_stack_pop(_stack);
			if (_e.nodeA != undefined) {
				if (_e.nodeB != undefined) ds_stack_push(_stack, _e.nodeB);
				ds_stack_push(_stack, _e.nodeA);
				continue;
			} else if (_e.nodeB != undefined) {
				ds_stack_push(_stack, _e.nodeB);
				continue;
			}
			var _entryWidth = _e.width;
			if (_imgWidth > _entryWidth) continue;
			var _entryHeight = _e.height;
			if (_imgHeight > _entryHeight) continue;
			var _remWidth = _entryWidth - _imgWidth;
			var _remHeight = _entryHeight - _imgHeight;
			if (_remWidth <= _remHeight) {
				_e.nodeA = new TexEntry(_e.left + _imgWidth, _e.top, _remWidth, _imgHeight);
				_e.nodeB = new TexEntry(_e.left, _e.top + _imgHeight, _entryWidth, _remHeight);
			} else {
				_e.nodeA = new TexEntry(_e.left, _e.top + _imgHeight, _imgWidth, _remHeight);
				_e.nodeB = new TexEntry(_e.left + _imgWidth, _e.top, _remWidth, _entryHeight);
			}
			_e.width = _imgWidth;
			_e.height = _imgHeight;
			ds_stack_clear(_stack);
			return _e;
		}
		return undefined;
	}
	self.nodeB = undefined;
	self.nodeA = undefined;
	self.yoffset = 0;
	self.xoffset = 0;
	self.left = _x;
	self.top = _y;
	self.width = _w;
	self.height = _h;
	static __class__ = mt_TexEntry;
});
mt_TexEntry.i_constructor = TexEntry;

#endregion

#region TexPage

globalvar TexPage; TexPage = method(undefined, function(_w, _h, _p) constructor {
	/// TexPage(w:int, h:int)
	/// @param {int} w
	/// @param {int} h
	static width = undefined;
	static height = undefined;
	static root = undefined;
	static sprite = undefined;
	static sprites = undefined;
	static surface = undefined;
	static padding = undefined;
	static destroy = function() {
		if (self.sprite != -1) {
			sprite_delete(self.sprite);
			self.sprite = -1;
			var __g = 0;
			var __g1 = self.sprites;
			while (__g < array_length(__g1)) {
				var _qs = __g1[__g];
				__g++;
				var _i = 0;
				for (var __g11 = _qs.count; _i < __g11; _i++) {
					_qs.images[@_i] = undefined;
				}
			}
		}
		if (self.surface != -1) {
			surface_free(self.surface);
			self.surface = -1;
		}
	}
	static add = function(_fname, _imgNumb, _ox, _oy) {
		if (self.sprite != -1) throw "This texture page is already finalized";
		var _spr = sprite_add(_fname, _imgNumb, false, false, 0, 0);
		if (_spr == -1) return undefined;
		var _sw = sprite_get_width(_spr);
		var _sh = sprite_get_height(_spr);
		var _qs = new TexSprite(_imgNumb, _ox, _oy);
		var _ob = gpu_get_blendmode_ext();
		gpu_set_blendmode_ext(2, 1);
		surface_set_target(self.surface);
		var _i = 0;
		for (var __g1 = _imgNumb; _i < __g1; _i++) {
			var _qe = self.root.add(_sw, _sh);
			_qs.images[@_i] = _qe;
			if (_qe != undefined) {
				_qe.xoffset = _ox;
				_qe.yoffset = _oy;
				draw_sprite(_spr, _i, _qe.left, _qe.top);
			}
		}
		gpu_set_blendmode_ext(_ob);
		surface_reset_target();
		sprite_delete(_spr);
		self.sprites[@array_length(self.sprites)] = _qs;
		return _qs;
	}
	
	static insertSprite = function(_spr, _imgNumb, _ox, _oy) {
		if (self.sprite != -1) throw "This texture page is already finalized";
		//var _spr = sprite_add(_fname, _imgNumb, false, false, 0, 0);
		if (_spr == -1) return undefined;
		var _sw = sprite_get_width(_spr);
		var _sh = sprite_get_height(_spr);
		var _qs = new TexSprite(_imgNumb, _ox, _oy);
		var _ob = gpu_get_blendmode_ext();
		gpu_set_blendmode_ext(2, 1);
		surface_set_target(self.surface);
		var _i = 0;
		for (var __g1 = _imgNumb; _i < __g1; _i++) {
			var _qe = self.root.add(_sw, _sh);
			_qs.images[@_i] = _qe;
			if (_qe != undefined) {
				_qe.xoffset = _ox;
				_qe.yoffset = _oy;
				draw_sprite(_spr, _i, _qe.left, _qe.top);
			}
		}
		gpu_set_blendmode_ext(_ob);
		surface_reset_target();
		sprite_delete(_spr);
		self.sprites[@array_length(self.sprites)] = _qs;
		return _qs;
	}
	
	static insertSurface = function(_surf ) {
		if (self.sprite != -1) throw "This texture page is already finalized";
		if (_surf == -1) return undefined;
		var _sw = surface_get_width(_surf)+self.padding*2;
		var _sh = surface_get_height(_surf)+self.padding*2;
		var _qs = new TexSprite(0, 0, 0);
		var _ob = gpu_get_blendmode_ext();
		gpu_set_blendmode_ext(2, 1);
		surface_set_target(self.surface);
		
		var _qe = self.root.add(_sw, _sh);
			
		_qs.images = _qe;
		if (_qe != undefined) {
			_qs.height = _sh;
			_qs.width = _sw;
			//trace("Adding Texture To Atlas",_qs.width,_qs.height);
			draw_surface_tiled_area_ext(_surf,_qe.left+self.padding,_qe.top+self.padding,_qe.left,_qe.top,_qe.left+_sw-1,_qe.top+_sh-1);
		}
		
		gpu_set_blendmode_ext(_ob);
		surface_reset_target();
		surface_free(_surf);
		self.sprites[@ array_length(self.sprites) ] = _qs;
		return _qs;
	}
	
	static finalize = function() {
		if (self.sprite != -1) throw "This texture page is already finalized";
		var __this = self.surface;
		self.sprite = sprite_create_from_surface(__this, 0, 0, surface_get_width(__this), surface_get_height(__this), false, false, 0, 0);
		var _i = 0;
		for (var __g1 = array_length(self.sprites); _i < __g1; _i++) {
			self.sprites[_i].sprite = self.sprite;
		}
		surface_free(self.surface);
	}
	self.sprites = [];
	self.sprite = -1;
	self.width = _w;
	self.height = _h;
	self.root = new TexEntry(0, 0, _w, _h);
	self.surface = surface_create(_w, _h);
	self.padding = _p;
	surface_set_target(self.surface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
	static __class__ = mt_TexPage;
});
mt_TexPage.i_constructor = TexPage;

#endregion

#region TexSprite

globalvar TexSprite; TexSprite = method(undefined, function(_count, _xofs, _yofs) constructor {
	/// TexSprite(count:int, xofs:real, yofs:real)
	/// @param {int} count
	/// @param {real} xofs
	/// @param {real} yofs
	static images = undefined;
	static count = undefined;
	static sprite = undefined;
	static xoffset = undefined;
	static yoffset = undefined;
	static setOffset = function(_xo, _yo) {
		var _dx = _xo - self.xoffset;
		var _dy = _yo - self.yoffset;
		var _i = 0;
		for (var __g1 = self.count; _i < __g1; _i++) {
			var _e = self.images[_i];
			if (_e != undefined) {
				_e.xoffset += _dx;
				_e.yoffset += _dy;
			}
		}
	}
	static draw = function(_subimg, _x, _y) {
		var _i = (_subimg | 0) % self.count;
		if (_i < 0) _i += self.count;
		var _e = self.images[_i];
		if (_e == undefined) return 0;
		draw_sprite_part(self.sprite, 0, _e.left, _e.top, _e.width, _e.height, _x - _e.xoffset, _y - _e.yoffset);
	}
	static drawExt = function(_subimg, _x, _y, _scaleX, _scaleY, _rot, _col, _alpha1) {
		var _i = (_subimg | 0) % self.count;
		if (_i < 0) _i += self.count;
		var _e = self.images[_i];
		if (_e == undefined) return 0;
		var _rx = lengthdir_x(1, _rot);
		var _ry = lengthdir_y(1, _rot);
		var _ox = -_e.xoffset * _scaleX;
		var _oy = -_e.yoffset * _scaleY;
		draw_sprite_general(self.sprite, 0, _e.left, _e.top, _e.width, _e.height, _x + _rx * _ox - _ry * _oy, _y + _ry * _ox + _rx * _oy, _scaleX, _scaleY, _rot, _col, _col, _col, _col, _alpha1);
	}
	static drawPart = function(_subimg, _left, _top, _width, _height, _x, _y) {
		var _i = (_subimg | 0) % self.count;
		if (_i < 0) _i += self.count;
		var _e = self.images[_i];
		if (_e == undefined) return 0;
		draw_sprite_part(self.sprite, 0, _e.left + _left, _e.top + _top, _width, _height, _x, _y);
	}
	static drawPartExt = function(_subimg, _left, _top, _width, _height, _x, _y, _sx, _sy, _rot, _c, _a) {
		var _i = (_subimg | 0) % self.count;
		if (_i < 0) _i += self.count;
		var _e = self.images[_i];
		if (_e == undefined) return 0;
		//var _rx = lengthdir_x(1, _rot);
		//var _ry = lengthdir_y(1, _rot);
		draw_sprite_general(self.sprite, 0, _e.left + _left, _e.top + _top, _width, _height, _x, _y, _sx, _sy, _rot, _c, _c, _c, _c, _a);
	}
	static drawGeneral = function(_subimg, _left, _top, _width, _height, _x, _y, _sx, _sy, _rot, _c1, _c2, _c3, _c4, _a) {
		var _i = (_subimg | 0) % self.count;
		if (_i < 0) _i += self.count;
		var _e = self.images[_i];
		if (_e == undefined) return 0;
		//var _rx = lengthdir_x(1, _rot);
		//var _ry = lengthdir_y(1, _rot);
		draw_sprite_general(self.sprite, 0, _e.left + _left, _e.top + _top, _width, _height, _x, _y, _sx, _sy, _rot, _c1, _c2, _c3, _c4, _a);
	}
	self.sprite = -1;
	self.count = _count;
	self.xoffset = _xofs;
	self.yoffset = _yofs;
	self.images = array_create(_count, undefined);
	static __class__ = mt_TexSprite;
});
mt_TexSprite.i_constructor = TexSprite;

#endregion



#region tex_std.haxe.class

function tex_std_haxe_class(_id, _name) constructor {
	// tex_std_haxe_class(id:int, name:string)
	static superClass = undefined;
	static i_constructor = undefined;
	static marker = undefined;
	static index = undefined;
	static name = undefined;
	self.superClass = undefined;
	self.marker = tex_std_haxe_type_markerValue;
	self.index = _id;
	self.name = _name;
	static __class__ = "class";
}
mt_tex_std_haxe_class.i_constructor = tex_std_haxe_class;

#endregion

// TexEntry:
 TexEntry.insertStack = ds_stack_create();
