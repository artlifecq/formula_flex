package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.utils.HeadBloodUtil;
	import com.rpgGame.coreData.type.HeadBloodStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import gs.TweenMax;
	
	import org.mokylin.skin.mainui.head.Head_Juese;
	import org.mokylin.skin.mainui.head.guai_head_mini;
	
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
	public class HeadBloodBar extends Sprite implements IInstancePoolClass
	{
		public static var isShowText:Boolean=false;
		private static var headBloodBarPool : InstancePool = new InstancePool("HeadBloodBar", 300);
		/**因为怪物的血条皮肤不一样**/
		private static var monsterBloodBarPool : InstancePool = new InstancePool("monsterHeadBloodBar", 300);
		/**
		 * 生成一个HeadBloodBar
		 */
		public static function create($role : SceneRole) : HeadBloodBar
		{
			//利用池生成HeadBloodBar
			var bar:HeadBloodBar;
			if(SceneCharType.MONSTER==$role.type)
			{
				bar=monsterBloodBarPool.createObj(HeadBloodBar, $role,true) as HeadBloodBar;
				
			}
			else
			{
				bar=headBloodBarPool.createObj(HeadBloodBar, $role,false) as HeadBloodBar;
			}
			
			bar.state=HeadBloodUtil.getRoleBloodBarState($role);
			return bar;
		}
		
		/**
		 * @private
		 * 回收一个HeadBloodBar
		 * @param bar
		 */
		public static function recycle(bar : HeadBloodBar) : void
		{
			if (bar._isMonster) 
			{
				monsterBloodBarPool.recycleObj(bar);
			}
			else
			{
				//利用池回收HeadBloodBar
				headBloodBarPool.recycleObj(bar);
			}
			
		}
		
		private var WIDTH : uint = 123;
		private var BLOOD_WIDTH : uint = 79;
		private var BLOOD_HEIGHT : uint = 9;
	
	
		private var tw:TweenMax;
		private var _isMonster:Boolean;
		/**上次的百分比**/
		private var _lastPercent : Number;
		/**状态文本，如：国战中的——攻方，守方**/
		private var _stateText : TextField;
		/** 状态 参考：HeadBloodStateType **/
		private var _state : uint;
		
		private var _hpSkinClass : Object;
		
		private var _role : SceneRole;
		
		private var _isDestroyed : Boolean;
		private var _isDisposed : Boolean;
		private var color:uint;
		
		private var _hpBar:UIAsset;
		public function HeadBloodBar($role : SceneRole,monster:Boolean)
		{
			super();
			_isDestroyed = false;
			_isMonster=monster;
			_role = $role;
			
			if (!_isMonster) 
			{
				_hpSkinClass = new Head_Juese();
			}
			else
			{
				_hpSkinClass=new guai_head_mini();
			}
			_hpSkinClass.toSprite(this);
			if (!_isMonster) 
			{
				_hpSkinClass.lbLevel.visible=false;
			}
			
			//_hpSkinClass.width=WIDTH;
			
//			_hpBackgroundBar = createBarBackground();
//			_hpBar = createBar();
//			if(_hpSkinClass){
//				_hpBackgroundBar.width=WIDTH;
//				_hpBar.width=WIDTH;
//			}
//			WIDTH = _hpBackgroundBar.width;
//			BLOOD_WIDTH = _hpBar.width;
//			BLOOD_HEIGHT = _hpBar.height;
//			touchGroup = touchable = false;
//			touchAcross = _hpBackgroundBar.touchAcross = _hpBar.touchAcross = true;
			
			reSet(null);
		}
		
		public function reSet($parameters : Array) : void
		{
			_isDisposed = false;
			if ($parameters!=null) 
			{
				_role=$parameters[0];
				_isMonster=$parameters[1];
			}
			setHpScale(1);
		}
		
		
		
		/**
		 * 设置状态信息			无特殊情况不用此方法，直接设置 state
		 * @param info
		 *
		 */
		public function updateStateText(info : String) : void
		{
			if (info == "")
			{
				if (_stateText != null)
				{
					_stateText.parent.removeChild(_stateText);
					_stateText = null;
				}
				return;
			}
			
			if (_stateText == null)
			{
				_stateText = new TextField(WIDTH, 18, "");
				_stateText.autoSize = TextFieldAutoSize.VERTICAL;
				addChild(_stateText);
				_stateText.y = -20;
				_stateText.touchAcross = true;
			}
			
			_stateText.color = color;
			_stateText.text = info;
		}
		
		public function set state(value : uint) : void
		{
			if (_state == value)
				return;
			
			_state = value;
			var arr : Array = HeadBloodUtil.getTypeData(_state);
			
			color = arr[0];
			//updateStateText(arr[1]);
			_hpSkinClass.barRed.visible=false;
			_hpSkinClass.barBlue.visible=false;
			if (!_isMonster) 
			{
				_hpSkinClass.barGreen.visible=false;
			}
			switch (_state)
			{
				case HeadBloodStateType.MAIN_CHAR:
					_hpBar=_hpSkinClass.barGreen;
					break;
				case HeadBloodStateType.ENEMY:
					_hpBar=_hpSkinClass.barRed;
					break;
				case HeadBloodStateType.TEAM:
				case HeadBloodStateType.NPC:
					_hpBar=_hpSkinClass.barBlue;
					break;
			}
			_hpBar.visible=true;
			if (!_isMonster) 
			{
				_hpSkinClass.uiQuan.styleName=HeadBloodUtil.getHPIconStyleName(_state);
				_hpSkinClass.lbLevel.visible=HeadBloodStateType.NPC!=_state;
			}
			
		}
		
		public function get state() : uint
		{
			return _state;
		}
	
		
		public function get realWidth() : uint
		{
			return _hpSkinClass.width;
		}
		
		public function get realHeight() : uint
		{
			return _hpSkinClass.height;
		}
		
		public function get textHeight() : uint
		{
			if (_stateText == null)
				return 0;
			
			return _stateText.height;
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
			
			if (value > 1)
				value = 1;
			
			if (value < 0)
				value = 0;
			//_hpBar.scaleX = value;
			setHpScale(value);
//			if (tw) 
//			{
//				tw.kill();
//			}
//			tw=TweenMax.to(_hpSkinClass.bar,0.5,{scaleX:value,onComplete:onTweenComplete});
			
			_lastPercent = value;
		}
		private function setHpScale(val:Number):void
		{
			_hpSkinClass.barRed.scaleX = val;
			_hpSkinClass.barBlue.scaleX = val;
			//玩家的
			if (!_isMonster) 
			{
				_hpSkinClass.barGreen.scaleX = val;
			}
		}
		public function showBloodText(str:String):void
		{
			if (isShowText) 
			{
				updateStateText(str);
			}
		}
		public function updateLevel(lv:int):void
		{
			if (!_isMonster) 
			{
				var label:Label=_hpSkinClass.lbLevel;
				label.text=lv+"";
				label.x=16-label.textWidth/2;
			}
			
		}
		private function onTweenComplete():void
		{
			tw=null;
		}
		public function instanceDestroy() : void
		{
			putInPool();
			dispose();
			_isDestroyed = true;
			_role=null;
		}
		
		public function putInPool() : void
		{
			if (parent != null)
				parent.removeChild(this);
			_role=null;
			_isDisposed = true;
		}
		public function checkState():void
		{
			if (!_isDisposed) 
			{
				state=HeadBloodUtil.getRoleBloodBarState(_role);
			}
		}
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isInPool():Boolean
		{
			return _isDisposed;
		}
		override public function set x(value:Number):void
		{
			if (value==0) 
			{
				trace("xxx error");
			}
			super.x=value;
		}
	}
}
