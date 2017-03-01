package com.rpgGame.appModule.role
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.beibao.beibao_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *角色面板 
	 * @author dik
	 * 
	 */
	public class RolePanel extends SkinUIPanel
	{
		private var _skin : beibao_Skin;
		
		private var basicView:BasicView;
		private var avatartView:AvatarView;
		private var packsView:PacksView;
		
		public function RolePanel()
		{
			this._skin = new beibao_Skin();
			super(_skin);
			
			initView();
		}
		
		private function initView():void
		{
			basicView=new BasicView(_skin);
			avatartView=new AvatarView(_skin);
			packsView=new PacksView(_skin);			
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			CONFIG::netDebug {
				NetDebug.LOG("[AppModule] [RolePanel] show");
			}
			super.show(data, openTable, parentContiner);
			avatartView.updateAvatar();
			
			packsView.updatePacks();
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			
			if(packsView.onTouchTarget(target)){
				return;
			}
			
			switch (target) {
				case this._skin.btn_close:
					this.hide();
					break;
			}
		}
	}
}