package com.rpgGame.appModule.fightsoul
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.WindowInfoData;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_path;
	import com.rpgGame.coreData.clientConfig.Q_windowInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.zhanhun.Zhanhun_ziyuanxian;
	
	import starling.display.DisplayObject;
	
	public class FightSoulActityCell extends DefaultListItemRenderer
	{
		private var _skin:Zhanhun_ziyuanxian;
		public function FightSoulActityCell():void
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin = new Zhanhun_ziyuanxian();
			_skin.toSprite(this);
			this.setSize(_skin.width,_skin.height);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(pathinfoData.isOver)
			{
				NoticeManager.showNotify("今日获取已达上限，每日03:00重置");
				return ;
			}
			var winInfo:Q_windowInfo = WindowInfoData.getInfobyId(path.q_winId);
			if(winInfo.q_islink==1)
			{
				AppManager.showApp(winInfo.q_windCodeId,winInfo.q_arg);
			}
		}
		override protected function commitData():void
		{
			var winInfo:Q_windowInfo = WindowInfoData.getInfobyId(path.q_winId);
			_skin.lb_name.text = winInfo.q_name;
			_skin.lb_cishu.text = pathinfoData.count.toString()+"/"+path.q_total;
			_skin.lb_jinyan.text = path.q_reward.toString()+"点";
			_skin.icon.visible = winInfo.q_islink==1;
			if(pathinfoData.isOver)
			{
				GrayFilter.gray(_skin.lb_name);
				GrayFilter.gray(_skin.lb_cishu);
				GrayFilter.gray(_skin.lb_jinyan);
				GrayFilter.gray(_skin.icon);
			}else{
				_skin.lb_name.filter = null;
				_skin.lb_cishu.filter = null;
				_skin.lb_jinyan.filter = null;
				_skin.icon.filter = null;
			}
		}
		
		private function get pathinfoData():FightSoulPathInfoData
		{
			return this.data as FightSoulPathInfoData;
		}
		public function get path():Q_fightsoul_path
		{
			return pathinfoData.path;
		}
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}