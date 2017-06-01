package com.rpgGame.appModule.open
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.Q_funcNotice;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import org.mokylin.skin.app.xingongneng.YuGao_Skin;
	
	import starling.display.DisplayObjectContainer;

	public class NoticePanel extends SkinUIPanel
	{
		private var _skin:YuGao_Skin;
		private var _qdata:Q_funcNotice;
		public function NoticePanel():void
		{
			_skin = new YuGao_Skin();
			super(_skin);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_qdata = data as Q_funcNotice;
			refeashView();
		}
		
		private function refeashView():void
		{
			var roleLevel:int = MainRoleManager.actorInfo.totalStat.level
			var info:Q_newfunc = NewFuncCfgData.getdataById(_qdata.q_newfunId);
			_skin.Icons.styleName = "ui/app/xingongneng/icon/"+info.q_openIcon+"/95.png";
			_skin.uiName.styleName = "ui/app/xingongneng/icon/"+info.q_openIcon+"/name1.png";
			_skin.numLevel.label = info.q_level.toString();
			var percent:Number = roleLevel/info.q_level;
			_skin.proLevel.value = percent*_skin.proLevel.maximum;
			_skin.lbLevel.text = roleLevel.toString()+"/"+info.q_level;
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x = 400;
			this.y = sh - 300;
		}
	}
}