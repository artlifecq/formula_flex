package com.rpgGame.appModule.mount
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.manager.mount.ZhanQiManager;
	import com.rpgGame.app.manager.mount.ZhanQiShowData;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.ZhanQiConfigData;
	import com.rpgGame.coreData.clientConfig.Q_warflag;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import org.mokylin.skin.app.zuoqi.Zuoqi_JingjieOk_Skin;
	
	import starling.display.DisplayObject;
	
	public class ZhanQiUpLevelSucessPanelExt extends SkinUIPanel
	{
		private var _skin:Zuoqi_JingjieOk_Skin;
		private var _curtentInterEff:InterObject3D;
		private var _avateUI:UIAvatar3D;
		private var _zhanqidata:ZhanQiShowData;
		private var _itemIcons:Vector.<IconCDFace>;
		private var _chengGongEftContaner:Inter3DContainer;	
		private var _chengGongEff:InterObject3D;
		public function ZhanQiUpLevelSucessPanelExt():void
		{
			_skin = new Zuoqi_JingjieOk_Skin();
			super(_skin);
			this.dragAble =false;
			this.model=true;
			MCUtil.removeSelf(_skin.mc_name);
			initView();
		}
		
		private function initView():void
		{
			_itemIcons = new Vector.<IconCDFace>();
			_chengGongEftContaner=new Inter3DContainer();
			_skin.uiGuangquan.addChild(_chengGongEftContaner);
			_avateUI=new UIAvatar3D(_skin.roleGrp,2);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			_chengGongEff=_chengGongEftContaner.playInter3DAt(ClientConfig.getEffect("ui_zuoqi_jinjiechenggongguangquan"),350,300,0);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			if(_chengGongEff!=null)
			{
				_chengGongEff.dispose();
				_chengGongEff=null;
			}
		}
		
		public function updateinfo(zhanqidata:ZhanQiShowData):void
		{
			_zhanqidata = zhanqidata;
			refeashModle();
			_skin.mc_zhanqiname.gotoAndStop(zhanqiLevel-1);
			_skin.mc_jieshu.gotoAndStop(zhanqiLevel-1);
			var rewards:Vector.<ClientItemInfo> = zhanqidata.rewardItems;
			var length:int = rewards.length;
			_rewardIconLength = 0;
//			const gap:Number = 13;
			var startx:Number = 653;//590-(length*IcoSizeEnum.ICON_64-gap*(length-1))/2;
			for(var i:int = 0;i<length;i++)
			{
				var icon:IconCDFace = getNextIcon();
				icon.y = 351;
				icon.x = startx+i*(17+IcoSizeEnum.ICON_48);
				FaceUtil.SetItemGrid(icon,rewards[i],true);
			}
			
			while(_itemIcons.length>_rewardIconLength)
			{
				this.removeChild(_itemIcons.pop(),true);
			}
			var props:Vector.<Number>;
			props = _zhanqidata.currentProp(props);
			var lastPower:int = FightValueUtil.calAtrributeFightPower(props,MainRoleManager.actorInfo.job);
			
			_zhanqidata.zhanqidataInfo = ZhanQiManager.instance().zhanqiDataInfo;
			props = _zhanqidata.currentProp(null);
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
				icon = IconCDFace.create(IcoSizeEnum.ICON_48);
				this._skin.container.addChild(icon);
				_itemIcons.push(icon);
			}
			_rewardIconLength++;
			return icon;
		}
		private function refeashModle():void
		{
			if(_curtentInterEff!=null)
			{
				this.removeChild3D(_curtentInterEff);
				_curtentInterEff = null;
			}
			
			var nextShet:Q_warflag = ZhanQiConfigData.getZhanQiDataById(zhanqiLevel);
			var currentName:String=nextShet.q_panel_show_id;
			_avateUI.updateBodyWithRes("pc/flag/"+currentName);
		}
		
		private function get zhanqiLevel():int
		{
			return _zhanqidata.zhanqiLevel;
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
