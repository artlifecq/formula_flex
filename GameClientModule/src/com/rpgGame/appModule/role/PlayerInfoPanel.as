package com.rpgGame.appModule.role
{
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
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data,SUB_ROLE,parentContiner);
			isSeeOther=true;
			_subRole.showCompareData(data);
		}
	}
}