package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import org.mokylin.skin.mainui.renwu.RenWu_Tips1;

	/**
	 * 主线任务tips
	 * @author YT
	 * 创建时间：2017-7-26 下午1:50:44
	 */
	public class TaskLeadTips extends SkinUI implements ITip
	{
		private static var _instance:TaskLeadTips;
		
		public static function get instance():TaskLeadTips
		{
			if (null == _instance)
			{
				_instance=new TaskLeadTips();
			}
			return _instance;
		}
		private var _skin:RenWu_Tips1;
		private var icoListGroup:RewardGroup;
		public function TaskLeadTips()
		{
			_skin=new RenWu_Tips1();
			super(_skin);
			init();
		}
		private function init():void
		{
			icoListGroup=new RewardGroup(IcoSizeEnum.ICON_42,_skin.ioc_1_0,RewardGroup.ALIN_CENTER,4,6,6);
			
		}
		public function setTipData(data:*):void
		{
			_skin.lbHead.htmlText=data.name;
			icoListGroup.setRewardByArray(TaskMissionCfgData.getRewordById(data.rewordid,MainRoleManager.actorInfo.job));
			icoListGroup.visible=true;
			_skin.imgBG.height=icoListGroup.y+icoListGroup.height+15;
			
		}
		public function hideTips():void
		{
			
		}
	
	}
}