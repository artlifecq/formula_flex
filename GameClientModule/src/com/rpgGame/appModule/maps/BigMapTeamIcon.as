package com.rpgGame.appModule.maps
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.info.map.MapTeamMemberInfo;
	
	import feathers.controls.UIAsset;
	
	import starling.display.Sprite;

	/**
	 *大地图上的队伍的点最多存在4个
	 * @author Administrator
	 * 
	 */	
	public class BigMapTeamIcon extends Sprite
	{
		private var icon:UIAsset;
		private var data:MapTeamMemberInfo;
		private var dataArr:Array=["无","无","0","0","0"];
		public function BigMapTeamIcon()
		{
			super();
			icon=new UIAsset();
			this.addChild(icon);
			TipTargetManager.show(this,TargetTipsMaker.makeSimplePropChangeTextTips("{0}:{1}<br>等级：{2}<br>坐标：{3},{4}",dataArr));
		}
		public function updateData(info:MapTeamMemberInfo):void
		{
			this.data=info;
			var url:String;
			var isCaptain:Boolean=Mgr.teamMgr.getPlayerIsCaptain(data.serverID);
			if (isCaptain) 
			{	
				url="ui/mainui/map/hongdian.png";
			}
			else
			{
				url="ui/mainui/map/lvdian.png";
			}
			if (icon.styleName!=url) 
			{
				icon.styleName=url;
			}
			if (data) 
			{
				dataArr[0]=isCaptain?"队长":"队员";
				dataArr[1]=data.name;
				dataArr[2]=data.level;
				dataArr[3]=data.x+"";
				dataArr[4]=data.y+"";
			}
		}
		override public function dispose():void
		{
			super.dispose();
			data=null;
			dataArr=null;
			TipTargetManager.remove(this);
		}
	}
}