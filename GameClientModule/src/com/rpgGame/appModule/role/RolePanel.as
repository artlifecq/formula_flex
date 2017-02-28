package com.rpgGame.appModule.role
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.beibao.beibao_Skin;
	import org.mokylin.skin.app.beibao.juese_Skin;
	
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
		
		private var basicView:BasicRoleView;
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
			_skin.jineng.visible=false;
			_skin.juese.visible=true;
			basicView=new BasicRoleView(_skin.juese.skin as juese_Skin);
			avatartView=new AvatarView(_skin.juese.skin as juese_Skin);
			packsView=new PacksView(_skin.juese.skin as juese_Skin);			
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			CONFIG::netDebug {
				NetDebug.LOG("[AppModule] [RolePanel] show");
			}
			super.show(data, openTable, parentContiner);
			basicView.show();
			avatartView.show();
			packsView.show();
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			
			if(packsView.onTouchTarget(target)){
				return;
			}
		}
		
		override public function hide():void
		{
			super.hide();
			basicView.onHide();
			avatartView.onHide();
			packsView.onHide();
		}
	}
}