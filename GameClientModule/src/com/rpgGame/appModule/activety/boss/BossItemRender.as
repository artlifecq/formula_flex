package com.rpgGame.appModule.activety.boss
{
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.SpecialActivitySender;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.cfg.active.BossActInfo;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.activety.ActiveItemSelecteSkin;
	import org.mokylin.skin.app.activety.shijieboss.ShiJieBoss_Item;
	
	import starling.display.DisplayObject;
	
	/**
	 *boss元素渲染器 
	 * @author dik
	 * 
	 */
	public class BossItemRender extends DefaultListItemRenderer
	{
		private var _skin:ShiJieBoss_Item;
		
		public function BossItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new ShiJieBoss_Item();
			_skin.toSprite(this);
			var btnSkin:ActiveItemSelecteSkin=new ActiveItemSelecteSkin();
			_skin.selectedBtn.upSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset2;
			_skin.selectedBtn.hoverSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.selectedUpSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.selectedDownSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.selectedHoverSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.downSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			var info:ActivetyInfo=_data as ActivetyInfo;
			switch(target){
				case _skin.selectedBtn:
					_skin.selectedBtn.isSelected=true;
					break;
				case _skin.btnEnter:
					if(info.info.joinState==0){
						NoticeManager.showNotifyById(61003);
						return;
					}
					if(info.info){
						SpecialActivitySender.reqJoinAct(info.info.activityId);
					}
					break;
			}
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
		
		override protected function commitData():void
		{
			if(_skin&&this.owner){
				if(_skin.selectedBtn.defaultIcon){
					_skin.selectedBtn.defaultIcon=null;
				}
				_skin.selectedBtn.isSelected=this.owner.selectedItem==data;
				var info:BossActInfo=_data as BossActInfo;
				_skin.uiName.styleName="ui/app/activety/shijieboss/diming/"+info.actCfg.q_res_id+".png";
				_skin.uiBg.styleName="ui/big_bg/activety/item/"+info.actCfg.q_res_id+".png";
				_skin.lbMsg1.htmlText=info.actCfg.q_desc;
				if(!info||info.info==null){
					return;
				}
				
				switch(info.info.joinState){
					case ActivityJoinStateEnum.KILLED_BOSS:
						_skin.uiJinxing.visible=true;
						break;
					default:
						_skin.uiJinxing.visible=false;
						break;
				}
				
				var lv:int=MainRoleManager.actorInfo.totalStat.level;
				if(lv<info.actCfg.q_activity_limit_level){
					_skin.lbLevel.text="(等级需求:"+info.actCfg.q_activity_limit_level+"级)";
					_skin.btnEnter.visible=false;
				}else{
					_skin.lbLevel.text="";
					_skin.btnEnter.visible=true;
				}
				
				var timeStr:String;
				if(_skin.uiJinxing.visible||info.info.joinState==0){
					var hm:int=ActivetyDataManager.getCurrentHM();
					var timeList:Array=ActivetyDataManager.getTimeList(info.actCfg);
					timeList=timeList[4];//第四个才是刷新段
					var next:int=timeList[0];
					var num:int=timeList.length;
					for(var i:int=0;i<num;i++){
						if(timeList[i]>hm){
							if((i+1)!=num){
								next=timeList[i+1];
							}else{
								next=timeList[0];
							}
							break;
						}
					}
					timeStr="下次刷新时间:"+TimeUtil.changeIntHM2Str(next);
					timeStr=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,timeStr);
				}else{
					timeStr="已刷新(未击杀)";
					timeStr=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,timeStr);
				}
				
				_skin.lbMsg2.htmlText=timeStr;
			}
		}
	}
}