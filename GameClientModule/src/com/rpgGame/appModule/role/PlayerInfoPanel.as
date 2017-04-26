package com.rpgGame.appModule.role
{
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.player.bean.OthersInfo;
	
	import starling.display.DisplayObjectContainer;

	/**
	 *玩家信息面板 
	 * @author dik
	 * 
	 */
	public class PlayerInfoPanel extends RolePanel
	{
		private var _otherInfo:OthersInfo;
		public function PlayerInfoPanel()
		{
			super();
		}
		
//		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
//		{
//			_data = data;
//			_openTab = openTable;
//			if (parentContiner == null)
//			{
//				parentContiner = StarlingLayerManager.appUILayer;
//			}
//			_parentContainer = parentContiner;
//			_roleData=data.roleData as HeroData;
//			_otherInfo=data.info as OthersInfo;
//			packsView.onHide();
//			refresh();
//			_parentContainer.addChild(this);
//			attConstrastView.show(_roleData);
//			basicView.show(_roleData);
//			avatarView.show(_roleData,_otherInfo.equips);
//		}
	}
}