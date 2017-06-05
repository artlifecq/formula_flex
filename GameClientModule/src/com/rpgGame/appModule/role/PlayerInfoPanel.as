package com.rpgGame.appModule.role
{
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.netData.player.bean.OthersInfo;
	
	import org.mokylin.skin.app.beibao.button.ButtonJuese;
	
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
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(ButtonJuese,SubRolePanel,EmFunctionID.EM_ROLE);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data,EmFunctionID.EM_ROLE,parentContiner);
		}
	}
}