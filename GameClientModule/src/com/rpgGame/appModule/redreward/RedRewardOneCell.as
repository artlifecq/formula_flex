package com.rpgGame.appModule.redreward
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.redreward.bean.RedRewardPlayerInfo;
	
	import org.mokylin.skin.app.hongbao.HongBao_Item2;
	import org.mokylin.skin.app.hongbao.HongBao_ItemBg;
	
	public class RedRewardOneCell extends SkinUI
	{
		private var _skin:HongBao_Item2;
		private static const playerNameList:Array = ["项少龙","嬴政","连晋","善柔","赵倩","乌应元","少原君","吕不韦"];
		public function RedRewardOneCell():void
		{
			_skin = new HongBao_Item2();
			super(_skin);
		}
		public function updata(index:int,list:Vector.<RedRewardPlayerInfo>,issystem:Boolean):void
		{
			var bgskin:HongBao_ItemBg = _skin.bg.skin as HongBao_ItemBg;
			if(index%2 ==0)
			{
				bgskin.bg1.visible = false;
			}else{
				bgskin.bg1.visible = true;
			}
			
			bgskin.bg2.visible = (index ==0);
			_skin.uiNo1.visible = (index ==0);
			
			if(issystem)
			{
				_skin.lbName.text = playerNameList[index];
				_skin.lbNum.text = "20礼金";
				_skin.lbName.visible = true;
				_skin.lbNum.visible = true;
			}else{
				var info:RedRewardPlayerInfo;
				if(list!=null&&list.length>index)
					info = list[index];
				if(info!=null)
				{
					_skin.lbName.text = info.playerName;
					_skin.lbNum.text = info.count.toString()+"礼金";
					_skin.lbName.visible = true;
					_skin.lbNum.visible = true;
				}else{
					_skin.lbName.visible = false;
					_skin.lbNum.visible = false;
				}
			}
			
		}
	}
}