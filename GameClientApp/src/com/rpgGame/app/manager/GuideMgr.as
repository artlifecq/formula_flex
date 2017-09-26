package com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.ui.main.guide.ArrowDown;
	import com.rpgGame.app.ui.main.guide.ArrowLeft;
	import com.rpgGame.app.ui.main.guide.ArrowRight;
	import com.rpgGame.app.ui.main.guide.ArrowUp;
	import com.rpgGame.app.ui.main.guide.BaseGuideArrow;
	import com.rpgGame.app.ui.main.guide.EnumArrowDir;
	import com.rpgGame.app.ui.main.guide.EnumGuideComplete;
	import com.rpgGame.app.ui.main.guide.EnumGuideStart;
	import com.rpgGame.core.events.FunctionOpenEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.clientConfig.Q_player_guide;
	import com.rpgGame.coreData.type.TaskType;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.DisplayObject;

	/**
	 *新手引导 
	 * @author yfl
	 * 
	 */	
	public class GuideMgr
	{
		private var _arrowHash:HashMap=new HashMap();
		private var _guideRoot:HashMap=new HashMap();
		private var _curGuideHash:HashMap=new HashMap();
		public function GuideMgr()
		{
			init();
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,onPlayerChange);
			EventManager.addEvent(FunctionOpenEvent.FUNCTIONOPENID,onOpenNewFunc);
			EventManager.addEvent(TaskEvent.TASK_NEW_MATION,onAcceptNewTask);
			EventManager.addEvent(SpellEvent.SPELL_ADD,onAddNewSkill);
		}
		
		private function onAddNewSkill(skill:int):void
		{
			// TODO Auto Generated method stub
			checkType(EnumGuideStart.S_GET_SKILL,skill);
		}
		private function init():void
		{
			var list:Vector.<Q_player_guide>=new Vector.<Q_player_guide>();
			var len:int=list.length;
			var tmp:Q_player_guide
			for(var i:int=0;i<len;i++)
			{
				tmp=list[i];
			
				
				//开始节点
				var tmpHash:HashMap=_guideRoot.getValue(tmp.q_start_type);
				if (!tmpHash) 
				{
					tmpHash=new HashMap();
					_guideRoot.put(tmp.q_start_type,tmpHash);
				}
			}
			
		}
		private function onAcceptNewTask(taskType:int):void
		{
			if (TaskType.MAINTYPE_MAINTASK==taskType) 
			{
				checkType(EnumGuideStart.S_ACCEPT_TASK,TaskManager.currentMainTaskInfo.id);
			}
		}
		private function onOpenNewFunc(list:Vector.<int>):void
		{
			// TODO Auto Generated method stub
			for each (var open:int in list) 
			{
				checkType(EnumGuideStart.S_NEW_FUNC,open);
			}
		}
		
		private function onPlayerChange():void
		{
			// TODO Auto Generated method stub
			checkType(EnumGuideStart.S_LEVEL,MainRoleManager.actorInfo.totalStat.level);
		}
		private function checkType(type:int,data:int):void
		{
			var list:Vector.<Q_player_guide>=_guideRoot.getValue(type);
			if (list) 
			{
				for each (var tmp:Q_player_guide in list) 
				{
					if (tmp.q_start_data==data) 
					{
						tryStart(tmp);
					}
				}
			}
		}
		public function test(dis:DisplayObject,type:int):void
		{
			var arrow:BaseGuideArrow=getArrow(type);
	
		}
		public function release(dis:DisplayObject,type:int):void
		{
			var arrow:BaseGuideArrow=getArrow(type);
			arrow.releaseTarget(dis);
		}
		private function getArrow(type:int):BaseGuideArrow
		{
			var arrow:BaseGuideArrow=_arrowHash.getValue(type);
			if (!arrow) 
			{
				switch(type)
				{
					case EnumArrowDir.DIR_RIGHT:
					{
						arrow=new ArrowRight();
						break;
					}
					case EnumArrowDir.DIR_LEFT:
					{
						arrow=new ArrowLeft();
						break;
					}
					case EnumArrowDir.DIR_UP:
					{
						arrow=new ArrowUp();
						break;
					}
					case EnumArrowDir.DIR_DOWN:
					{
						arrow=new ArrowDown();
						break;
					}
				}
				_arrowHash.put(type,arrow);
			}
			return arrow;
		}
	
		
		public function tryComplete(complete:Q_player_guide):void
		{
			// TODO Auto Generated method stub
			_curGuideHash.remove(complete.q_id);
		}
		public function tryStart(start:Q_player_guide):void
		{
			_curGuideHash.put(start.q_id,start);
			if (EnumGuideComplete.C_AUTO==start.q_complete_condiction) 
			{
				tryComplete(start);
			}
		}
	}
}