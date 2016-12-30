package com.rpgGame.app.graphics
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.utils.HeadBloodUtil;
	
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.head.MonsterHpBarSkin;
	
	import starling.display.BlendMode;
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	
	/**
	 *
	 * 头部血条
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-10 上午11:12:28
	 *
	 */
	public class HeadBloodBar extends Sprite implements IPoolClass
	{
		private static var headBloodBarPool : Pool = new Pool("HeadBloodBar", 300);
		
		/**
		 * 生成一个HeadBloodBar
		 */
		public static function create($role:SceneRole) : HeadBloodBar
		{
			//利用池生成HeadBloodBar
			return headBloodBarPool.createObj(HeadBloodBar,$role) as HeadBloodBar;
		}
		
		/**
		 * @private
		 * 回收一个HeadBloodBar
		 * @param bar
		 */
		public static function recycle(bar : HeadBloodBar) : void
		{
			//利用池回收HeadBloodBar
			headBloodBarPool.disposeObj(bar);
		}
		
		private var WIDTH : uint = 114;
		private var BLOOD_WIDTH:uint = 79;
		private var BLOOD_HEIGHT:uint = 8;
		/**部件类型**/
		private var _partType : uint;
		/**血条颜色**/
		private var _color : uint = 0xFF0000;
		/**血条**/
		private var _hpBar : DisplayObject;
		/**血条背景**/
		private var _hpBackgroundBar : DisplayObject;
		/**上次的百分比**/
		private var _lastPercent : Number;
		/**状态文本，如：国战中的——攻方，守方**/
		private var _stateText:TextField;
		/** 状态 参考：HeadBloodStateType **/
		private var _state:uint;
		
		private var _hpSkinClass:StateSkin;
		
		private var _role:SceneRole;
		
		public function HeadBloodBar($role:SceneRole)
		{
			super();
			
			_role = $role;
			
			//_hpSkinClass = new MonsterHpBarSkin();
			//_hpSkinClass.toSprite(this);
			
			_hpBackgroundBar = createBarBackground();
			_hpBar = createBar();
			
			WIDTH = _hpBackgroundBar.width;
			BLOOD_WIDTH = _hpBar.width;
			BLOOD_HEIGHT = _hpBar.height;
			touchGroup = touchable = false;
			touchAcross = _hpBackgroundBar.touchAcross = _hpBar.touchAcross = true;
			
			reSet(null);
		}
		
		public function reSet($parameters : Array) : void
		{
			
		}
		
		private function createBarBackground():DisplayObject
		{
			if(_hpSkinClass)
			{
				return _hpSkinClass["bg"];
			}
			
			var bg:Quad = new Quad(WIDTH, BLOOD_HEIGHT , 0x000000);
			bg.blendMode = BlendMode.NONE;
			addChild(bg);
			return bg;
		}
		
		private function createBar():DisplayObject
		{
			if(_hpSkinClass)
			{
				//				return IHeadHPBar(_hpSkinClass).hpBar;
				return _hpSkinClass["bar"];
			}
			var bar:Quad = new Quad(WIDTH-2, BLOOD_HEIGHT-2, 0xff0000);
			bar.blendMode = BlendMode.NONE;
			bar.x = bar.y = 1;
			addChild(bar);
			return bar;
		}
		
		/**
		 * 设置状态信息			无特殊情况不用此方法，直接设置 state
		 * @param info
		 * 
		 */		
		public function updateStateText( info:String ):void
		{
			if( info == "" )
			{	
				if( _stateText != null )
				{
					_stateText.parent.removeChild( _stateText );
					_stateText = null;
				}
				return;
			}
			
			if( _stateText == null )
			{
				_stateText = new TextField(WIDTH,18,"");
				_stateText.autoSize = TextFieldAutoSize.VERTICAL;
				addChild( _stateText );
				_stateText.y = -20;
				_stateText.touchAcross = true;
			}
			
			_stateText.color = color;
			_stateText.text = info;
		}
		
		public function set state( value:uint ):void
		{
			if( _state == value )
				return;
			
			_state = value;
			var arr:Array = HeadBloodUtil.getTypeData( _state );
			
			color = arr[0];
			updateStateText( arr[ 1 ] );
			
			if(_hpBar is Quad)
				Quad(_hpBar).color = color;
			else if(_hpBar is UIAsset)
			{
				(_hpBar as UIAsset).styleName = HeadBloodUtil.getBarStyleName(_state);
			}
		}
		
		public function get state():uint
		{
			return _state;
		}
		
		public function get color() : uint
		{
			return _color;
		}
		
		public function set color(value : uint) : void
		{
			_color = value;
		}
		
		public function get realWidth() : uint
		{
			return WIDTH;
		}
		
		public function get realHeight() : uint
		{
			if( _stateText == null )
				return BLOOD_HEIGHT;
			
			return _stateText.height + BLOOD_HEIGHT;
		}
		
		public function get textHeight():uint
		{
			if( _stateText == null )
				return 0;
			
			return _stateText.height;
		}
		
		public function set partType(value : uint) : void
		{
			_partType = value;
		}
		
		public function get partType() : uint
		{
			return _partType;
		}
		
		/**
		 * 更新血条
		 * @param value		血量百分比
		 * @author 卢国征   2015-5-5
		 */
		public function update(value : Number) : void
		{
			if (_lastPercent == value)
				return;
			
			if( value > 1)
				value = 1;
			
			if( value < 0 )
				value = 0;
			
			if(_hpBar is Quad)
				Quad(_hpBar).color = _color;
			
			_hpBar.width = (BLOOD_WIDTH -2) * value;
			
			_lastPercent = value;
		}
		
		/**
		 * 销毁
		 */
		override public function dispose() : void
		{
			return;
			if (parent != null)
				parent.removeChild(this);
			super.dispose();
		}
	}
}
