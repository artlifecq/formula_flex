package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.tip.BossHurtTipsData;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import org.mokylin.skin.app.activety.shijieboss.ShiJieBossTips;
	
	public class ShiJieBossRewardTips extends SkinUI implements ITip
	{
		private var _skin:ShiJieBossTips;
		private var iconList:Vector.<IconCDFace>;
		
		public function ShiJieBossRewardTips()
		{
			_skin=new ShiJieBossTips();
			super(_skin);
			iconList=Vector.<IconCDFace>();
		}
		
		public function setTipData(data:*):void
		{
			var bossHurtTipsData:BossHurtTipsData=(data as DynamicTipData).data;
			var reward:Array=bossHurtTipsData.rewads;
			var num:int=reward.length;
			var row:int;
			for(var i:int=0;i<num;i++){
				var icon:IconCDFace=IconCDFace.create(IcoSizeEnum.ICON_48);
				iconList.push(icon);
				var itemInfo:ClientItemInfo=new ClientItemInfo(reward[i].mod);
				itemInfo.itemInfo=new ItemInfo();
				itemInfo.itemInfo.isbind=reward[i].bind;
				itemInfo.itemInfo.num=reward[i].num;
				FaceUtil.SetItemGrid(icon,itemInfo);
				row=Math.floor(i/4);
				icon.x=15+(i%4)*60;
				icon.y=90+row*60+5;
			}
			_skin.bg.height=icon.y+70;
			_skin.uiHead.styleName=bossHurtTipsData.titleRes;
		}
		
		public function hideTips():void
		{
			var icon:IconCDFace;
			while(iconList.length>0){
				icon=iconList.pop();
				icon.destroy();
			}
		}
	}
}