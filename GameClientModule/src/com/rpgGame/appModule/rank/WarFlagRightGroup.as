package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.manager.mount.ZhanQiShowData;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.netData.warFlag.bean.WarFlagDataInfo;
	
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	
	public class WarFlagRightGroup extends RightGroupBase
	{
		public function WarFlagRightGroup(skin:PaiHang_Right, type:int)
		{
			super(skin, type);
		}
		private var _zhanqiShowData:ZhanQiShowData;
		private var _zhanqiDataInfo:WarFlagDataInfo;
		override protected function initView():void
		{
			super.initView();
			_zhanqiShowData = new ZhanQiShowData();
			_zhanqiShowData.useExtraItem(0,0);
			_zhanqiDataInfo = new WarFlagDataInfo();
		}
		override protected function initData():void
		{
			super.initData();
			_zhanqiShowData.zhanqiJob=_topInfo.job;
			_zhanqiDataInfo.warFlagModelId = _topInfo.playerBriefInfo.warFlagModelId;
			_zhanqiShowData.zhanqidataInfo=_zhanqiDataInfo;
			
			var props:Vector.<Number> =  _zhanqiShowData.currentProp(null);
			_power = FightValueUtil.calAtrributeFightPower(props,_zhanqiShowData.zhanqiJob);
		}
		
		override protected function refeashEquip():void
		{
			_skin.weapons.visible = false;
		}
		
		override protected function refeashName():void
		{
			_skin.grpHead.visible = true;
			_skin.lbName.visible = false;
			_skin.headName.styleName = "ui/app/paihangbang/word/zhanqi/"+_zhanqiDataInfo.warFlagModelId.toString()+".png"
		}
	}
}