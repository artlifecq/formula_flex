package com.rpgGame.app.ui.main.top
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.role.HeroData;
	
	import org.mokylin.skin.mainui.top.top_jingyan_Skin;
	
	public class ExpBar extends SkinUI
	{
		private var _skin : top_jingyan_Skin;
		
		private var maxW:int;
		
		public function ExpBar()
		{
			this._skin = new top_jingyan_Skin();
			super(this._skin);
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
			//测试数据
			heroData.curExp=5963;
			heroData.canStorageExp=8000;
			//
			var scale:Number=heroData.curExp/heroData.canStorageExp;
			_skin.top_bar.width=maxW*scale;
			_skin.top_bar2.width=_skin.top_bar.width;
		}
	}
}