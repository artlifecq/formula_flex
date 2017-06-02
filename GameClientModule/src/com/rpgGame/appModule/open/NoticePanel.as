package com.rpgGame.appModule.open
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import org.mokylin.skin.app.xingongneng.YuGao_Skin;
	
	import starling.display.DisplayObjectContainer;

	public class NoticePanel extends SkinUIPanel
	{
		private var _skin:YuGao_Skin;
		private var _qdata:Q_newfunc;
		public function NoticePanel():void
		{
			_skin = new YuGao_Skin();
			super(_skin);
			this.escExcuteAble = false;
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			if(this.parent == null)
				super.show(data,openTable,parentContiner);
			_qdata = data as Q_newfunc;
			refeashView();
		}
		
		private function refeashView():void
		{
			var roleLevel:int = MainRoleManager.actorInfo.totalStat.level
			_skin.Icons.styleName = "ui/app/xingongneng/icon/"+_qdata.q_openIcon+"/95.png";
			_skin.uiName.styleName = "ui/app/xingongneng/icon/"+_qdata.q_openIcon+"/name1.png";
			_skin.numLevel.label = _qdata.q_level.toString();
			var percent:Number = roleLevel/_qdata.q_level;
			_skin.proLevel.value = percent*_skin.proLevel.maximum;
			_skin.lbLevel.text = roleLevel.toString()+"/"+_qdata.q_level;
			if(_qdata.q_dicpic=="")
				_skin.uiTouxian.visible = false;
			else{
				_skin.uiTouxian.visible = true;
				_skin.uiTouxian.styleName = "ui/app/xingongneng/"+_qdata.q_dicpic+".png";
			}
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x = 400;
			this.y = sh - 300;
		}
	}
}