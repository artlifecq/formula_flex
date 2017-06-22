package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.ui.common.DefaultPageItemRender;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.banghui.wangcheng.ZhanBaoInfo_Item;
	
	/**
	 *王城争霸战申请列表渲染器 
	 * @author dik
	 * 
	 */
	public class WczbWarApplyItemRender extends DefaultPageItemRender
	{
		private var _skin:ZhanBaoInfo_Item;
		public function WczbWarApplyItemRender()
		{
			_skin=new ZhanBaoInfo_Item();
			super(_skin);
		}
		
		
		override public function get height():Number
		{
			if(_skin){
				return _skin.height;
			}
			return 0;
		}
		
		override protected function commitData():void
		{
			if(_skin){
				
			}
		}
	}
}