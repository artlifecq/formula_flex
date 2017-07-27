package com.rpgGame.app.ui.tips
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_section;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.mainui.renwu.RenWuTipItem;
	import org.mokylin.skin.mainui.renwu.RenWu_Tips2;

	/**
	 * 环式任务tips
	 * @author YT
	 * 创建时间：2017-7-26 下午1:53:47
	 */
	public class TaskloopTips  extends SkinUI implements ITip
	{
		private static var _instance:TaskloopTips;
		
		public static function get instance():TaskloopTips
		{
			if (null == _instance)
			{
				_instance=new TaskloopTips();
			}
			return _instance;
		}
		private var _skin:RenWu_Tips2;
		private var icoListGroup:RewardGroup;
		private var rewrdList:Vector.<SkinnableContainer>;
		private var icoList:Vector.<RewardGroup>;
		public function TaskloopTips()
		{
			_skin=new RenWu_Tips2();
			super(_skin);
			init();
		}
		private function init():void
		{
			icoListGroup=new RewardGroup(IcoSizeEnum.ICON_42,_skin.ioc_1_0,RewardGroup.ALIN_LEFT,4,6,6);
			rewrdList=new Vector.<SkinnableContainer>();
			icoList=new Vector.<RewardGroup>();
		}
		public function setTipData(data:*):void
		{
			_skin.lbHead.htmlText=data.name;//{rewordid:taskData.q_reword_id,exId:task.loopRewardId,nowTrea:task.loopNumber}
			icoListGroup.setRewardByArray(TaskMissionCfgData.getRewordById(data.rewordid,MainRoleManager.actorInfo.job));
			icoListGroup.visible=true;
			var exId:String=data.loopRewardId;
			var nowTrea:int=data.loopNumber;//当前环数
			var taskSection:Q_mission_section=TaskMissionCfgData.getSectionByID(exId);
			var i:int;
			for(i=0;i<rewrdList.length;i++)
			{
				rewrdList[i].visible=false;
			}
			var height:int=0;
			if(taskSection!=null)
			{
				var rewards:String=taskSection.q_sec_rewards;
				var reObj:Object=JSONUtil.decode(rewards);
				var reArr:Array=reObj as Array;
				var skinItem:SkinnableContainer;
				var rewItem:RenWuTipItem;
				var iconItem:RewardGroup;
				for(i=0;i<reArr.length;i++)
				{
					if(i<rewrdList.length)
					{
						skinItem=rewrdList[i];
						skinItem.visible=true;
						rewItem=skinItem.skin as RenWuTipItem;
						iconItem=icoList[i];
					}
					else
					{
						skinItem=getRenWuTipItem();
						rewrdList.push(skinItem);
						_skin.item_list.addChild(skinItem);
						rewItem=skinItem.skin as RenWuTipItem;
						iconItem=new RewardGroup(IcoSizeEnum.ICON_42,rewItem.ioc_1,RewardGroup.ALIN_LEFT,4,6,6);
						icoList.push(iconItem);
					}
					skinItem.y=height;
					rewItem.lbName.htmlText="今日完成<font color='#00ff33'>"+reArr[i].l+"</font>环任务奖励";
					iconItem.setRewardByArray(TaskMissionCfgData.getRewordById(reArr[i].r,MainRoleManager.actorInfo.job));
					rewItem.uiOk.visible=reArr[i].l<=nowTrea;
					height+=iconItem.y+iconItem.height;
				}
			}
			_skin.grpfoot.y=_skin.item_list.y+height+4;
			_skin.imgBG.height=_skin.grpfoot.y+36;
			
		}
		public function hideTips():void
		{
			
		}
		private function getRenWuTipItem():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 81;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.RenWuTipItem()
			temp.skin = skin
			temp.width = 221;
			temp.x = 4;
			temp.y = 125;
			return temp;
		}
	}
}