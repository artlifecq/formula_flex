package com.rpgGame.app.ui
{
	import com.rpgGame.app.manager.fight.AttChangePanle;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.events.MainPlayerEvent;
	
	import feathers.controls.StateSkin;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 * 具有属性改变的ui
	 * @author dik
	 * 
	 */
	public class AttChangeView extends ViewUI
	{
		protected var attChangeTypes:Array;
		protected var attChangeEft:AttChangePanle;
		
		public function AttChangeView(skin:StateSkin=null)
		{
			super(skin);
			attChangeEft=new AttChangePanle(_stateSkin.width/2,_stateSkin.height/2);
			_stateSkin.container.addChild(attChangeEft);
		}
		
		override public function show(data:Object=null):void
		{
			EventManager.addEvent(MainPlayerEvent.MODULE_STAT_CHANGE,statChange);
		}
		
		override public function hide():void
		{
			super.hide();
			attChangeEft.clear();
			EventManager.removeEvent(MainPlayerEvent.MODULE_STAT_CHANGE,statChange);
		}
		
		private function statChange(type:int,hash:HashMap):void
		{
			if(attChangeTypes.indexOf(type)==-1)
				return ;			
			attChangeEft.addChangeHandler(hash);
		}
	}
}