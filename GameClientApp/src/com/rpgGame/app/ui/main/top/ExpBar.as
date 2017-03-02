package com.rpgGame.app.ui.main.top
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.top.top_jingyan_Skin;
	
	public class ExpBar extends SkinUI
	{
		private var _skin : top_jingyan_Skin;
		
		private var maxW:int;
		
		public function ExpBar()
		{
			this._skin = new top_jingyan_Skin();
			super(this._skin);
			
			initEvent();
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.NOWEXP_CHANGE,updateExpBar);
			EventManager.addEvent(MainPlayerEvent.STAT_MAX_CHANGE,updateMaxExpBar);
		}
		
		private function updateMaxExpBar(type:int=1):void
		{
			if(type!=CharAttributeType.RES_EXP){
				return;
			}
			updateExpBar();
		}
		
		public function resize(w : int, h : int) : void {
			this.x=this.y = 0;
			_skin.top_bg.width=w;
			maxW=w;
			updateExpBar();
		}
		
		private function updateExpBar():void
		{
			var heroData:HeroData=MainRoleManager.actorInfo;
			var scale:Number=heroData.curExp/heroData.maxExp;
			_skin.top_bar.width=maxW*scale;
			_skin.top_bar2.width=_skin.top_bar.width;
		}
	}
}