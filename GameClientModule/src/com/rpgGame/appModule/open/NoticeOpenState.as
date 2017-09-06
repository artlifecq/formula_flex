package com.rpgGame.appModule.open
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import org.mokylin.skin.app.xingongneng.YuGao_Skin;
	
	public class NoticeOpenState extends SkinUI
	{
		private var _skin:YuGao_Skin;
		public function NoticeOpenState():void
		{
			_skin = new YuGao_Skin();
			super(_skin);
		}
		
		public function refeashView(data:Q_newfunc):void
		{
			var roleLevel:int = MainRoleManager.actorInfo.totalStat.level
			_skin.Icons.styleName = "ui/icon/xingongneng/"+data.q_res_dir+"/95.png";
			_skin.uiName.styleName = "ui/icon/xingongneng/"+data.q_res_dir+"/name1.png";
			_skin.numLevel.label = data.q_level.toString();
			var percent:Number = roleLevel/data.q_level;
			_skin.proLevel.value = percent*_skin.proLevel.maximum;
			_skin.lbLevel.text = roleLevel.toString()+"/"+data.q_level;
			if(!data.q_res_dir)
				_skin.uiTouxian.alpha = 0;
			else{
				_skin.uiTouxian.alpha = 1;
				_skin.uiTouxian.styleName = "ui/icon/xingongneng/"+data.q_res_dir+"/word.png";
			}
		}
		
		override public function get width():Number
		{
			return _skin.width;
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
		
	}
}