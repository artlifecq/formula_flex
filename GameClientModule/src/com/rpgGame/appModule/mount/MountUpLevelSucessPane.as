package com.rpgGame.appModule.mount
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
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
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import org.mokylin.skin.app.zuoqi.Zuoqi_JingjieOk_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class MountUpLevelSucessPane extends SkinUIPanel
	{
		private var _skin:Zuoqi_JingjieOk_Skin;
		private var _curtentInter3D:InterObject3D;
		private var _mountdata:MountShowData;
		private var _itemIcons:Vector.<IconCDFace>;
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
		}
		
		public function updateinfo(mountdata:MountShowData):void
		{
			_mountdata = mountdata;
			refeashModle();
			_skin.mc_name.gotoAndStop(mountLevel);
			var rewards:Vector.<ClientItemInfo> = mountdata.rewardItems;
			var length:int = rewards.length;
			_rewardIconLength = 0;
			const gap:Number = 13;
			var startx:Number = 590-(length*IcoSizeEnum.ICON_64-gap*(length-1))/2;
			for(var i:int = 0;i<length;i++)
			{
				var icon:IconCDFace = getNextIcon();
				icon.y = 251;
				icon.x = startx+i*(gap+IcoSizeEnum.ICON_64);
				FaceUtil.SetItemGrid(icon,rewards[i],true);
			}
			
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
			_skin.userData.number = levelPower;
			_skin.num_lv.number = levelPower - lastPower;
		}
		
		private var _rewardIconLength:int = 0;
		
		private function getNextIcon():IconCDFace
		{
			var icon:IconCDFace;
			if(_rewardIconLength<_itemIcons.length)
			{
				icon = _itemIcons[_rewardIconLength];
			}else{
				icon = IconCDFace.create(IcoSizeEnum.ICON_64);
				icon.width = icon.height = IcoSizeEnum.ICON_64;
				icon.setBg(GridBGType.GRID_SIZE_64);
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
			_curtentInter3D = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "mount2",ClientConfig.getAvatar(nextShet.q_skinResID));
			data.animatorSourchPath = ClientConfig.getAvatar(nextShet.q_animatResID);
			data.forceLoad=true;//ui上的3d特效强制加载
			var unit : RenderUnit3D = _curtentInter3D.addRenderUnitWith(data, 0);
			unit.setStatus("stand");
			_curtentInter3D.x = 300;
			_curtentInter3D.y = 350;
			_curtentInter3D.rotationY = 60;
			unit.addUnitAtComposite(unit);
			this.addChild3D(_curtentInter3D);
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