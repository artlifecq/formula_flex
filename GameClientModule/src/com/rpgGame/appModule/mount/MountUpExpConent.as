package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import org.mokylin.skin.app.zuoqi.Zuoqi_Skin;
	import com.rpgGame.app.manager.mount.MountShowData;

	public class MountUpExpConent
	{
		private var _skin:Zuoqi_Skin;
		private var _itemIconList:Vector.<IconCDFace>;
		public function MountUpExpConent(skin:Zuoqi_Skin):void
		{
			_skin = skin;
			super();
			initView();
		}
		private function initView():void
		{
			_itemIconList = new Vector.<IconCDFace>();
			var icon:IconCDFace = FaceUtil.creatIconCDFaceByUIAsset(_skin.grid_1,IcoSizeEnum.ICON_48);
			_itemIconList.push(icon);
			icon = FaceUtil.creatIconCDFaceByUIAsset(_skin.grid_2,IcoSizeEnum.ICON_48);
			_itemIconList.push(icon);
		}
		private var _mountShowData:MountShowData;
		public function updataInfo(mountShowData:MountShowData):void
		{
			_mountShowData = mountShowData;
			this.isAutoing = _mountShowData.isAutoing;
			const housedata:Q_horse = _mountShowData.housedata;
			if(_mountShowData.haveChange)
			{
				var rewards:Vector.<ClientItemInfo> = _mountShowData.rewardItems;
				for(var index:int = 0;index<rewards.length;index++)
				{
					_itemIconList[index].visible = true;
					FaceUtil.SetItemGrid(_itemIconList[index], rewards[index], true);
					_itemIconList[index].setIconPoint(5,5);
				}
				for(;index<_itemIconList.length;index++)
				{
					_itemIconList[index].visible = false;
				}
				if(_mountShowData.needClearExp())
				{
					_skin.lab_zhufuzhi.text = "本阶祝福值不清零";
					_skin.lab_zhufuzhi.color = 0x5cb006;
				}else{
					_skin.lab_zhufuzhi.text = "祝福值每日0点清零";
					_skin.lab_zhufuzhi.color = 0xe1201c;
				}
			}
			const percent:Number = _mountShowData.percent;
			_skin.progressbar.value = _skin.progressbar.maximum*percent;
			_skin.progressbar_light.x = _skin.progressbar.x +_skin.progressbar.width*percent-3;
			_skin.lab_progressbar.text = _mountShowData.exp.toString()+"/"+housedata.q_blessnum_limit.toString();
			
			_skin.lab_xuyaowupin.htmlText = _mountShowData.upLevelItem.name+"*"+_mountShowData.upLevelNeedItemCount+"("+_mountShowData.bagHaveItemCount+")";
			if(_mountShowData.canUpLevel())
			{
				_skin.lab_xuyaowupin.color = 0x5DBD37;
			}else{
				_skin.lab_xuyaowupin.color = 0xd02525;
			}
		}
		public function set isAutoing(value:Boolean):void
		{
			_mountShowData.isAutoing = value;
			_skin.btn_kaishi.visible = !_mountShowData.isAutoing;
			_skin.btn_zidong.visible = !_mountShowData.isAutoing;
			_skin.btn_tingzhi.visible = _mountShowData.isAutoing;
		}
		
	}
}