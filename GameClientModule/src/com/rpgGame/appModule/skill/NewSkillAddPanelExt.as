package  com.rpgGame.appModule.skill
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.app.view.icon.BaseIcon;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.ShortcutsTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	import gs.easing.Expo;
	
	import org.mokylin.skin.app.xinjineng.XinJiNeng_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	
	public class NewSkillAddPanelExt extends SkinUIPanel
	{
		
		private var _skin:XinJiNeng_Skin;
		private var _icon:BaseIcon;
		private var _effcon:Inter3DContainer;
		private var _effect3d:InterObject3D;
		private var _maskSprite:Sprite;
	
		private var _flyIcon:UIAsset=new UIAsset();
		private var _skill:SkillInfo;
		private var _timer:GameTimer;
		private var _endTime:int;
		private var _obj:Object={};
		private var _flyStartPt:Point;
		public function NewSkillAddPanelExt()
		{
			this.dragAble=false;
			this.escExcuteAble=false;
			_skin=new XinJiNeng_Skin();
			super(_skin);
			_icon=new BaseIcon(IcoSizeEnum.ICON_64);
			_icon.x=27;
			_icon.y=29;
			_skin.uiKuang.addChild(_icon);
			
			_maskSprite=new Sprite();
			_maskSprite.graphics.beginFill(0);
			_maskSprite.graphics.drawRect(0,0,_skin.grpName.width,_skin.grpName.height);
			_maskSprite.graphics.endFill();
			_maskSprite.pivotX=_maskSprite.width/2;
			_maskSprite.pivotY=_maskSprite.height/2;
			_maskSprite.x=_skin.grpName.x+_skin.grpName.width/2;
			_maskSprite.y=_skin.grpName.y+_skin.grpName.height/2;
			
			_skin.grpName.mask=_maskSprite;
			_skin.container.addChild(_maskSprite);
			_effcon=new Inter3DContainer();
			_effcon.x=_skin.gGai.x+136/2;
			_effcon.y=_skin.gGai.y+109/2;
			this.addChild(_effcon);
			
			_flyIcon=new UIAsset();
			_timer=new GameTimer("NewSkillAddPanelExt");
			_timer.onUpdate=onTimer;
			
			_flyStartPt=new Point();
			
		}
		private function onTimer():void
		{
			var diff:Number=_endTime-getTimer();
			var left:int=Math.ceil((diff)/1000);
			if (left>0) 
			{
				_skin.lbTime.text=left+"后自动关闭";
			}
			else
			{
				_timer.stop();
				hide();
				toMis();
			}
		}
		private function effeclComplete(...arg):void
		{
			_effect3d=null;
		}
		private function start(skill:SkillInfo):void
		{
			reset();
			_skin.gGai.visible=true;
			_skin.bg.visible=true;
			this._skill=skill;
			_flyIcon.styleName=ClientConfig.getSkillIcon(SpellDataManager.getSpellData(skill.skillModelId).q_icon,48);
			_icon.setIconResName(ClientConfig.getSkillIcon(SpellDataManager.getSpellData(skill.skillModelId).q_icon,IcoSizeEnum.ICON_64));
			_skin.uiName.styleName="ui/app/xinjineng/"+skill.skillModelId+".png"
			
			if (!_effect3d) 
			{
				_effect3d=_effcon.playInter3DAt(ClientConfig.getEffect("ui_xinjinengkaiqi"),0,0,1,effeclComplete);
			}
			
			TweenLite.to(this._obj,1.35,{onComplete:stepLightComplete});
		}
		//裂缝完成
		private function stepLightComplete():void
		{
			_skin.gGai.visible=false;
		
			TweenLite.to(_maskSprite,0.4,{scaleX:1,onComplete:stepScaleComplete});
		}
		private function stepScaleComplete():void
		{
			_endTime=getTimer()+5000;
		
			_timer.start();
		}
		private function toMis():void
		{
			_skin.bg.visible=false;
			_flyIcon.x=_flyStartPt.x;
			_flyIcon.y=_flyStartPt.y;
			
			StarlingLayerManager.topUILayer.addChild(_flyIcon);
			
			var toP:Point;
			var cfg:Q_skill_model=SpellDataManager.getSpellData(_skill.skillModelId,_skill.skillLevel);
			if(cfg.q_trigger_type==1)
			{
				var index:int=cfg.q_seat-1;//配置从1开始的 
				toP=MainUIManager.mainui.shortcutBar.getSkillGridSeat(index);
				setTimeout(ShortcutsManger.getInstance().updateNewSpell,500,cfg,true);
			}
			else
			{
				
				toP=MainUIManager.getBtnGolbalPos(MainButtonManager.getButtonName(4));
			}
			TweenLite.to(_flyIcon,0.5,{x:toP.x,y:toP.y,onComplete:flytoShortcutComplete,ease:Expo.easeIn});	
			
		}
		private function flytoShortcutComplete():void
		{
			
			MCUtil.removeSelf(_flyIcon);
		}
		private function reset():void
		{
			if (_effect3d) 
			{
				_effect3d.dispose();
				_effect3d=null;
			}
			_maskSprite.scaleX=0;
			TweenLite.killTweensOf(_obj);
			TweenLite.killTweensOf(_maskSprite);
			TweenLite.killTweensOf(_flyIcon);
			
			
		
			MCUtil.removeSelf(_flyIcon);
			_timer.stop();
			_skin.lbTime.text="5秒后自动关闭";
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.hintUILayer);
			start(data)
		}
		
		override protected function onStageResize(sw:int, sh:int):void
		{
			this.x=(sw-this.width)/2;
			this.y=sh-450;
		}
		override protected function onHide():void
		{
			super.onHide();
			//reset();
		}
		override public function hide():void
		{
			//toMis();
			super.hide();
			reset();
		}
		override protected function onShow():void
		{
			super.onShow();
			this._icon.localToGlobal(new Point(0,0),_flyStartPt);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			hide();
			toMis();
		}
	}
}