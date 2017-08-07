package com.rpgGame.appModule.activety.zonghe
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.activety.ActiveItemSelecteSkin;
	import org.mokylin.skin.app.activety.zonghe.Active_Item;
	
	import starling.display.DisplayObject;
	
	/**
	 *活动条渲染器 
	 * @author dik
	 * 
	 */
	public class ZongHeItemRender extends DefaultListItemRenderer
	{
		private var _skin:Active_Item;
		
		public function ZongHeItemRender()
		{
			super();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.selectedBtn){
				_skin.selectedBtn.isSelected=true;
			}
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
		
		override protected function initialize():void
		{
			_skin=new Active_Item();
			_skin.toSprite(this);
			
			var btnSkin:ActiveItemSelecteSkin=new ActiveItemSelecteSkin();
			_skin.selectedBtn.upSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset2;
			_skin.selectedBtn.hoverSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.selectedUpSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.selectedDownSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.selectedHoverSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
			_skin.selectedBtn.downSkin=btnSkin.__ActiveItemSelecteSkin_UIAsset1;
		}
		
		override protected function commitData():void
		{
			if(_skin&&this.owner){
				if(_skin.selectedBtn.defaultIcon){
					_skin.selectedBtn.defaultIcon=null;
				}
				_skin.selectedBtn.isSelected=this.owner.selectedItem==data;
				var info:ActivetyInfo=_data as ActivetyInfo;
				if(!info||info.info==null){
					return;
				}
				_skin.uiName.styleName="ui/app/activety/zonghe/active_name/"+info.actCfg.q_res_id+".png";
				_skin.uiBg.styleName="ui/big_bg/activety/item/"+info.actCfg.q_res_id+".png";
				_skin.lbMsg.htmlText=info.actCfg.q_desc;
				
				if(info.info.joinState==ActivityJoinStateEnum.JOINING){
					_skin.mcEffect.visible=true;
					_skin.mcEffect.autoPlay=true;
				}else{
					_skin.mcEffect.visible=false;
					_skin.mcEffect.autoPlay=false;
				}
				
//				info.actCfg.q_lt_res="kuafu";
				
				if(info.actCfg.q_lt_res){
					_skin.lt_icon.visible=true;
					_skin.lt_icon.styleName="ui/common/"+info.actCfg.q_lt_res+".png";
				}else{
					_skin.lt_icon.visible=false;
				}
				
				var lv:int=MainRoleManager.actorInfo.totalStat.level;
				if(lv<info.actCfg.q_activity_limit_level){
					_skin.lbLevel.text="(等级需求:"+info.actCfg.q_activity_limit_level+")";
				}else{
					_skin.lbLevel.text="";
				}
				
//				info.info.joinState=ActivityJoinStateEnum.UN_TODAY;
				
				switch(info.info.joinState){
					case ActivityJoinStateEnum.UN_TODAY:
						_skin.state_icon.styleName="ui/app/activety/feidangri.png";
						grayItem();
						break;
					case ActivityJoinStateEnum.UN_OPEN:
						_skin.state_icon.styleName="ui/app/activety/weikaiqi.png";
						ungrayItem();
						break;
					case ActivityJoinStateEnum.JOINING:
						_skin.state_icon.styleName="ui/app/activety/jinxingzhong2.png";
						ungrayItem();
						break;
					case ActivityJoinStateEnum.OVER:
						_skin.state_icon.styleName="ui/app/activety/yijieshu.png";
						grayItem();
						break;
					default:
						break;
				}
			}
		}
		
		private function grayItem():void
		{
			GrayFilter.gray(_skin.uiName);
			GrayFilter.gray(_skin.uiBg);
			GrayFilter.gray(_skin.state_icon);
			_skin.lbLevel.color=StaticValue.A_UI_GRAY_TEXT;
			_skin.lbMsg.color=StaticValue.A_UI_GRAY_TEXT;
		}
		
		private function ungrayItem():void
		{
			GrayFilter.unGray(_skin.uiName);
			GrayFilter.unGray(_skin.uiBg);
			GrayFilter.unGray(_skin.state_icon);
			_skin.lbMsg.color=StaticValue.A_UI_YELLOW_TEXT;
			_skin.lbLevel.color=StaticValue.Q_YELLOW;
		}
	}
}