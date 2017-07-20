package com.rpgGame.appModule.mount
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.fight.spell.NumberChangeEffect;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import org.mokylin.skin.app.zuoqi.Zuoqi_JingjieOk_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;
	
	public class MountUpLevelSucessPane extends SkinUIPanel
	{
		private var _skin:Zuoqi_JingjieOk_Skin;
		private var _curtentInter3D:InterObject3D;
		private var _mountdata:MountShowData;
		private var _itemIcons:Vector.<IconCDFace>;
		private var _numbereffect:NumberChangeEffect;
		public function MountUpLevelSucessPane():void
		{
			_skin = new Zuoqi_JingjieOk_Skin();
			super(_skin);
			this.model = true;
			initView();
		}
		private function initView():void
		{
			_itemIcons = new Vector.<IconCDFace>();
			_skin.mc_zhanqiname.visible = false;
			_numbereffect = new NumberChangeEffect(_skin.userData);
			var sr3D : InterObject3D = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect("ui_zuoqi_jinjiechenggongguangquan"));
			data.forceLoad=true;//ui上的3d特效强制加载
			sr3D.addRenderUnitWith(data, 0);
			
			sr3D.x = 340;
			sr3D.y = 316;
			addChild3D(sr3D,2);
		}
		
		public function updateinfo(mountdata:MountShowData):void
		{
			_mountdata = mountdata;
			refeashModle();
			_skin.mc_jieshu.gotoAndStop(mountLevel-1);
			_skin.mc_name.gotoAndStop(mountLevel-1);
			var rewards:Vector.<ClientItemInfo> = mountdata.rewardItems;
			var length:int = rewards.length;
			_rewardIconLength = 0;
			const gap:Number = 17;
			var startx:Number = 752-(length*IcoSizeEnum.ICON_48-gap*(length-1))/2;
			for(var i:int = 0;i<length;i++)
			{
				var icon:IconCDFace = getNextIcon();
				icon.y = 351;
				icon.x = startx+i*(gap+IcoSizeEnum.ICON_48);
				FaceUtil.SetItemGrid(icon,rewards[i],true);
			}
			
			if(_mountdata.percent<0.9)
				_skin.uiName.styleName = "ui/app/zuoqi/rpbftqjj.png";
			else
				_skin.uiName.styleName = "ui/app/zuoqi/jjcg.png";
			_skin.uiName.x = 753-_skin.uiName.width/2;
			while(_itemIcons.length>_rewardIconLength)
			{
				this.removeChild(_itemIcons.pop(),true);
			}
			var props:Vector.<Number>;
			props = _mountdata.currentProp(props);
			var lastPower:int = FightValueUtil.calAtrributeFightPower(props,MainRoleManager.actorInfo.job);
			
			_mountdata.horsedataInfo = HorseManager.instance().horsedataInfo;
			props = _mountdata.currentProp(null);
			var levelPower:int = FightValueUtil.calAtrributeFightPower(props,MainRoleManager.actorInfo.job);
			_numbereffect.updateValue(lastPower,levelPower);
			_numbereffect.runEffect();
			_skin.num_lv.number = levelPower - lastPower;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			TimerServer.addLoop(updateTime,20000);
		}
		override public function hide():void
		{
			super.hide();
			TimerServer.remove(updateTime);
		}
		private function updateTime():void
		{
			(_curtentInter3D.baseObj3D as RenderUnit3D).setStatus(RoleActionType.SHOW_IDLE);
		}
		private var _rewardIconLength:int = 0;
		
		private function getNextIcon():IconCDFace
		{
			var icon:IconCDFace;
			if(_rewardIconLength<_itemIcons.length)
			{
				icon = _itemIcons[_rewardIconLength];
			}else{
				icon = IconCDFace.create(IcoSizeEnum.ICON_48);
				icon.setBg(GridBGType.GRID_SIZE_48);
				this.addChild(icon);
				_itemIcons.push(icon);
			}
			_rewardIconLength++;
			return icon;
		}
		private function refeashModle():void
		{
			if(_curtentInter3D!=null)
			{
				this.removeChild3D(_curtentInter3D);
				_curtentInter3D = null;
			}
			var nextShet:Q_horse = HorseConfigData.getMountDataById(mountLevel);
			if(!nextShet){
				return;
			}
			_curtentInter3D = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "mount2",ClientConfig.getAvatar(nextShet.q_skinResID));
			data.animatorSourchPath = ClientConfig.getAvatar(nextShet.q_animatResID);
			data.forceLoad=true;//ui上的3d特效强制加载
			var unit : RenderUnit3D = addRenderUnitWith(data,_curtentInter3D);
			unit.setScale(1.5);
			_curtentInter3D.x = 340;
			_curtentInter3D.y = 420;
			_curtentInter3D.rotationY = 60;
			
			unit.addUnitAtComposite(unit);
			this.addChild3D(_curtentInter3D);
		}
		private function addRenderUnitWith(rend : RenderParamData3D,src3d:InterObject3D):RenderUnit3D
		{
			var unit : RenderUnit3D;
			unit = RenderUnit3D.create(rend);
			unit.repeat = 1;
			unit.setPlayCompleteCallBack(onPlayComplete, src3d);
			unit.setAddedCallBack(addComplete);
			src3d.setRenderUnit(unit);
			return unit;
		}
		private function addComplete(unit : RenderUnit3D):void
		{
			unit.setStatus(RoleActionType.SHOW_IDLE);
		}
		private function onPlayComplete(iter3d:InterObject3D,unit : RenderUnit3D ):void
		{
			unit.setStatus(RoleActionType.STAND);
		}
		
		private function get mountLevel():int
		{
			return _mountdata.mountLevel;
		}
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			switch(target)
			{
				case _skin.btnOk:
					this.hide();
					break;
			}
		}
	}
}