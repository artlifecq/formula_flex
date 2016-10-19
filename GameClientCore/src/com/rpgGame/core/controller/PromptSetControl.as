package com.rpgGame.core.controller
{
	import com.game.mainCore.core.manager.SOManager;
	import com.rpgGame.coreData.enum.PromptSaveNameEnum;
	import com.rpgGame.coreData.enum.PromptSaveType;
	import com.rpgGame.coreData.enum.SharedObjectEnum;
	
	import flash.net.SharedObject;
	import flash.utils.Dictionary;

	/**
	 * 游戏里的弹出框的， 不再提示的设置 
	 * @author fly
	 * 
	 */	
	public class PromptSetControl
	{
		
		private var _currentLifeDic:Dictionary = new Dictionary();
		private static var _instance:PromptSetControl;
		
		public static function get instance():PromptSetControl
		{
			if(_instance == null)
			{
				_instance = new PromptSetControl();
			}
			return _instance;
		}
		
		private var _sharedObject:SharedObject;
		public function PromptSetControl()
		{
			_sharedObject = SOManager.getUserSO(SharedObjectEnum.PROMPT_SO);
		}
		
		/**
		 * alert被关闭的时候，更新以后是否提示的设置 
		 * @param promptName
		 * @param isPrompt
		 * 
		 */		
		public function updatePrompt(promptName:PromptSaveNameEnum,isPrompt:Boolean):void
		{
			if(promptName.saveType == PromptSaveType.THIS_LOGIN)
			{
				_currentLifeDic[promptName.saveName] = isPrompt;
			}else if(promptName.saveType == PromptSaveType.SHARED_OBJECT)
			{
				_sharedObject.data[promptName.saveName] = isPrompt;
				SOManager.flush(_sharedObject);
			}
		}
		
		/**
		 * 获取某个弹出框的设置 
		 * 
		 */		
		public function isAlert(promptName:PromptSaveNameEnum):Boolean
		{
			var isAlert:Boolean = true;
			if(promptName.saveType == PromptSaveType.THIS_LOGIN)
			{
				if(_currentLifeDic.hasOwnProperty(promptName.saveName))
				{
					isAlert = !_currentLifeDic[promptName.saveName];
				}
			}else if(promptName.saveType == PromptSaveType.SHARED_OBJECT)
			{
				if(_sharedObject && _sharedObject.data.hasOwnProperty(promptName.saveName))
				{
					isAlert = !_currentLifeDic[promptName.saveName];
				}
			}
			return isAlert;
		}
	}
}