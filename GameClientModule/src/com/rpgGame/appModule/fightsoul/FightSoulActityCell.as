package com.rpgGame.appModule.fightsoul
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.HuBaoManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.HuBaoSender;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_path;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.lang.LangUI_2;
	import com.rpgGame.coreData.type.TaskType;
	
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
			if(target==_skin.btn_send)
			{
				switch(path.q_type)
				{
					case 1:
						FunctionOpenManager.openFunctionId(newFunc);
						break;
					case 2:
						if(path.q_id==1)
							TaskControl.killWalkBut(TaskType.MAINTYPE_TREASUREBOX,0,1);
						else if(path.q_id==2)
							TaskControl.killWalkBut(TaskType.MAINTYPE_GUILDDAILYTASK,0,1);
						break;
					case 3:
						HuBaoSender.upCSGoConvoyMessage();
						break;
				}
			}else{
				/*if(path.q_type==1)
				{
					FunctionOpenManager.openFunctionId(newFunc);
				}else{
					_skin.btn_send.visible =true;
				}*/
				switch(path.q_type)
				{
					case 1:
						FunctionOpenManager.openFunctionId(newFunc);
						break;
					case 2:
						if(path.q_id==1)
							TaskControl.killWalkBut(TaskType.MAINTYPE_TREASUREBOX,0,2);
						else if(path.q_id==2)
							TaskControl.killWalkBut(TaskType.MAINTYPE_GUILDDAILYTASK,0,2);
						break;
					case 3:
						HuBaoManager.instance().onwalkToNpc(path.q_arg);
						break;
				}
			}
			
		}
		override protected function commitData():void
		{
			_skin.lb_name.text = path.q_name;
			_skin.lb_cishu.text = pathinfoData.count.toString()+"/"+path.q_total;
			_skin.lb_jinyan.text =LanguageConfig.getText(LangUI_2.FightSoulShowReward).replace("$",path.q_reward)
			
			if(path.q_type==1)
			{
				_skin.btn_send.visible =false;
			}else{
				_skin.btn_send.visible =true;
			}
			_skin.btn_send.visible  = !(path.q_type==1);
			
			if(pathinfoData.isOver)
			{
				_skin.lb_name.color = StaticValue.A_UI_GRAY_TEXT;
				_skin.lb_cishu.color = StaticValue.A_UI_GRAY_TEXT;
				_skin.lb_jinyan.color = StaticValue.A_UI_GRAY_TEXT;
				GrayFilter.gray(_skin.btn_send);
			}else{
				/*_skin.lb_name.filter = null;
				_skin.lb_cishu.filter = null;
				_skin.lb_jinyan.filter = null;*/
				_skin.lb_name.color = StaticValue.A_UI_BEIGE_TEXT;
				_skin.lb_cishu.color = StaticValue.Q_GREEN;
				_skin.lb_jinyan.color = StaticValue.Q_YELLOW;
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