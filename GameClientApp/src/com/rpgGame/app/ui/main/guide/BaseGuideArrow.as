package com.rpgGame.app.ui.main.guide
{
	import com.rpgGame.app.ctrl.TouchCtrl;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.clientConfig.Q_player_guide;
	
	import flash.geom.Point;
	
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	
	import gs.TweenMax;
	
	import starling.display.DisplayObject;
	
	public class BaseGuideArrow extends SkinUI
	{
		protected var _align:int;
		protected var _target:DisplayObject;
		protected var _pos:Point;
		protected var _touch:TouchCtrl;
		protected var _time:Number=0.6;
		protected var _offset:int=15;
		private var _tween:TweenMax;
		private var _guideData:Q_player_guide;
		public function BaseGuideArrow(align:int,skin:StateSkin=null)
		{
			this._align=align;
			_pos=new Point();
			super(skin);
			this.touchable=false;
		}
		private function tryComplete():void
		{
			Mgr.guideMgr.tryComplete(_guideData)
		}
		public function comlete():void
		{
			releaseTarget(_target);
		}
		public function releaseTarget(tar:DisplayObject):void
		{
			if (tar==_target) 
			{
				if (_touch) 
				{
					_touch.dispose();
					_touch=null;
				}
				_target=null;
				MCUtil.removeSelf(this);
				if (_tween) 
				{
					_tween.kill();
					_tween=null;
				}
				_guideData=null;
			}
		}
		public function bindTarget(tar:DisplayObject,config:Q_player_guide):void
		{
			if (_target!=null||_tween!=null) 
			{
				throw new Error("BaseGuideArrow cur _target is not null or tween is not null!!!!");
				return;
			}
			this._guideData=config;
			this._target=tar;
			var gText:DisplayObject=Object(_stateSkin).gText;
			var arrow:DisplayObject=Object(_stateSkin).arrow;
			if (config.q_guide_text!=null&&config.q_guide_text!="") 
			{
				gText.visible=true;
				var lab:Label=Object(_stateSkin).lbName;
				lab.text=config.q_guide_text;
			}
			else
			{
				gText.visible=false;
			}
			var tw:Object;
			switch(_align)
			{
				case EnumArrowDir.DIR_RIGHT:
				{
					_pos.x=_target.x;
					_pos.y=_target.y+_target.height/2;
					tw={ x:_pos.x + _offset, yoyo:true, repeat: -1 };
					break;
				}
				case EnumArrowDir.DIR_UP:
				{
					_pos.x=_target.x+_target.width/2;
					_pos.y=_target.y+_target.height;
					tw={ y:_pos.y - _offset, yoyo:true, repeat: -1 };
					break;
				}
				case EnumArrowDir.DIR_LEFT:
				{
					_pos.x=_target.x+_target.width;
					_pos.y=_target.y+_target.height/2;
					tw={ x:_pos.x - _offset, yoyo:true, repeat: -1 };
					break;
				}
				case EnumArrowDir.DIR_DOWN:
				{
					_pos.x=_target.x+_target.width/2;
					_pos.y=_target.y;
					tw={ y:_pos.y + _offset, yoyo:true, repeat: -1 };
					break;
				}
			}
			this.x=_pos.x;
			this.y=_pos.y;
			if (_target.parent) 
			{
				_target.parent.addChild(this);
			}
			_touch=new TouchCtrl(_target,onClickTarget,null,null,onTargetRemove);
			_tween=TweenMax.to(this,_time,tw);
		}
		
		private function onClickTarget():void
		{
			// TODO Auto Generated method stub
			if (_guideData) 
			{
				if (EnumGuideComplete.C_CLICK==_guideData.q_complete_condiction||
					EnumGuideComplete.C_CLICK_CLOSE==_guideData.q_complete_condiction) 
				{
					tryComplete();
				}
			}
		}
		private function onTargetRemove():void
		{
			if (EnumGuideComplete.C_CLOSE==_guideData.q_complete_condiction||
				EnumGuideComplete.C_CLICK_CLOSE==_guideData.q_complete_condiction) 
			{
				tryComplete();
			}
		}
	}
}