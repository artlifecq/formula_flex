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
			_skin.Icons.styleName = "ui/app/xingongneng/icon/"+data.q_openIcon+"/95.png";
			_skin.uiName.styleName = "ui/app/xingongneng/icon/"+data.q_openIcon+"/name1.png";
			_skin.numLevel.label = data.q_level.toString();
			var percent:Number = roleLevel/data.q_level;
			_skin.proLevel.value = percent*_skin.proLevel.maximum;
			_skin.lbLevel.text = roleLevel.toString()+"/"+data.q_level;
			if(data.q_dicpic=="")
				_skin.uiTouxian.alpha = 0;
			else{
				_skin.uiTouxian.alpha = 1;
				_skin.uiTouxian.styleName = "ui/app/xingongneng/icon/"+data.q_openIcon+"/word.png";
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