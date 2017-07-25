package com.rpgGame.appModule.fightsoul
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_path;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.lang.LangUI_2;
	
	import feathers.controls.Button;
	import feathers.controls.ButtonState;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.zhanhun.Zhanhun_ziyuanxian;
	import org.mokylin.skin.common.ItemBg;
	
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
			_skin.conOver.visible = false;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(pathinfoData.isOver)
			{
				NoticeManager.showNotifyById(4010);
				return ;
			}
			FunctionOpenManager.openFunctionId(newFunc);
		}
		override protected function commitData():void
		{
			_skin.lb_name.text = newFunc.q_string_name;
			_skin.lb_cishu.text = pathinfoData.count.toString()+"/"+path.q_total;
			_skin.lb_jinyan.text =LanguageConfig.getText(LangUI_2.FightSoulShowReward).replace("$",path.q_reward)
			
			var ids:Array = JSONUtil.decode(newFunc.q_main_id) as Array;
			var fuc:FunctionBarInfo = FuncionBarCfgData.getActivityBarInfo(ids[0]);
			_skin.btn_send.visible = fuc.clickType==1;
			if(pathinfoData.isOver)
			{
				GrayFilter.gray(_skin.lb_name);
				GrayFilter.gray(_skin.lb_cishu);
				GrayFilter.gray(_skin.lb_jinyan);
				GrayFilter.gray(_skin.btn_send);
			}else{
				_skin.lb_name.filter = null;
				_skin.lb_cishu.filter = null;
				_skin.lb_jinyan.filter = null;
				_skin.btn_send.filter = null;
			}
			ItemBg(_skin.bg.skin).bg1.visible = (this.index%2==0);
		}
		override protected function changeState(value:String):void
		{
			super.changeState(value);
			_skin.conOver.visible = (value!=ButtonState.UP);
		}
		
		private function get pathinfoData():FightSoulPathInfoData
		{
			return this.data as FightSoulPathInfoData;
		}
		private function get path():Q_fightsoul_path
		{
			return pathinfoData.path;
		}
		private function get newFunc():Q_newfunc
		{
			return pathinfoData.newFunc;
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}