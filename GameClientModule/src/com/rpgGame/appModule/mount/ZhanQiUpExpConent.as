package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.manager.mount.ZhanQiShowData;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.clientConfig.Q_warflag;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.TipType;
	
	import away3d.events.Event;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.zuoqi.Zhanqi_Skin;
	
	import utils.TimerServer;
	
	public class ZhanQiUpExpConent
	{
		private var _skin:Zhanqi_Skin;
		
		private var _itemIconList:Vector.<IconCDFace>;
		
		private var _updateTime:int=1000/40;
		
		public function ZhanQiUpExpConent(skin:Zhanqi_Skin)
		{
			_skin=skin;
			super();
			initView();
		}
		
		private function initView():void
		{
			_itemIconList = new Vector.<IconCDFace>();
			var icon:IconCDFace = new IconCDFace(IcoSizeEnum.ICON_48);	//FaceUtil.creatIconCDFaceByUIAsset(_skin.grid_1,IcoSizeEnum.ICON_48,1,5,5);
			icon.bindBg(_skin.grid_1);
			_itemIconList.push(icon);
			_skin.uplevelgroup.addChild(icon);
			icon = new IconCDFace(IcoSizeEnum.ICON_48);//FaceUtil.creatIconCDFaceByUIAsset(_skin.grid_2,IcoSizeEnum.ICON_48,1,5,5);
			icon.bindBg(_skin.grid_2);
			_itemIconList.push(icon);
			_skin.uplevelgroup.addChild(icon);
			_skin.chk_zidonggoumai.addEventListener(Event.CHANGE,checkChangeHandler);
		}
		
		private function checkChangeHandler():void
		{
			_zhanqiShowData.isAutoBuyItem = _skin.chk_zidonggoumai.isSelected;
		}
		private var _zhanqiShowData:ZhanQiShowData;
		public function updataInfo(zhanqiShowData:ZhanQiShowData):void
		{
			_zhanqiShowData = zhanqiShowData;
			_skin.chk_zidonggoumai.isSelected = _zhanqiShowData.isAutoBuyItem;
			this.isAutoing = _zhanqiShowData.isAutoing;
			
			if(!_zhanqiShowData.isMaxLevel)
			{
				TipTargetManager.remove(_skin.expgroup);
				_skin.grp_jinjie.visible = true;
				_skin.maximg.visible = false;
				_skin.lab_xuyaowupin.htmlText = _zhanqiShowData.upLevelItem.name+"*"+_zhanqiShowData.upLevelNeedItemCount;
				if(_zhanqiShowData.canUpLevel())
				{
					_skin.lab_xuyaowupin.color = 0x5DBD37;
				}else{
					_skin.lab_xuyaowupin.color = 0xd02525;
				}
				_skin.uplevelgroup.visible = true;
				
			}else{
				_skin.grp_jinjie.visible = false;
				_skin.uplevelgroup.visible = false;
				_skin.maximg.visible = true;
			}
		}
		protected function updataReward():void
		{
			const zhanqidata:Q_warflag = _zhanqiShowData.zhanqidata;
			if(_zhanqiShowData.haveChange)
			{
				var rewards:Vector.<ClientItemInfo> = _zhanqiShowData.rewardItems;
				for(var index:int = 0;index<rewards.length;index++)
				{
					_itemIconList[index].visible = true;
					FaceUtil.SetItemGrid(_itemIconList[index], rewards[index], true);
				}
				for(;index<_itemIconList.length;index++)
				{
					_itemIconList[index].visible = false;
				}
				if(_zhanqiShowData.needClearExp())
				{
					_skin.lab_zhufuzhi.text = "本阶祝福值不清零";
					_skin.lab_zhufuzhi.color = 0x5cb006;
				}else{
					_skin.lab_zhufuzhi.text = "祝福值每日0点清零";
					_skin.lab_zhufuzhi.color = 0xe1201c;
				}
			}
			//				const percent:Number = _zhanqiShowData.percent;
			TipTargetManager.show(_skin.expgroup,TargetTipsMaker.makeTips(TipType.BLESS_TIP,_zhanqiShowData));
		}
		public function updateExp(exp:int=0,count:int=0):void
		{
			if(exp==0&&count==0){
				_skin.progressbar1.maximum = _zhanqiShowData.zhanqidata.q_blessnum_limit;
				_skin.progressbar1.value = _zhanqiShowData.exp;
				_skin.lab_progressbar.text = _zhanqiShowData.exp.toString()+"/"+_zhanqiShowData.zhanqidata.q_blessnum_limit.toString();
				TimerServer.remove(showExpAnimation);
				updataReward();
				return;
			}
			var changeExp:int=exp-_skin.progressbar1.value;
			if(changeExp<=0){
				return;
			}
			var addExp:int=changeExp/count;
			TimerServer.addLoop(showExpAnimation,_updateTime,[addExp],count);
			_skin.progressbar1.maximum =_zhanqiShowData.zhanqidata.q_blessnum_limit;
		}
		
		private function showExpAnimation(exp:int):void
		{
			_skin.progressbar1.value =int(_skin.progressbar1.value)+ exp;
			_skin.lab_progressbar.text =_skin.progressbar1.value+"/"+_skin.progressbar1.maximum;
		}
		
		private var _isAutoing:Boolean;
		
		public function set isAutoing(value:Boolean):void
		{
			if(_zhanqiShowData.isMaxLevel)
			{
				value = false;
			}else{
				_skin.btn_kaishi.visible = !value;
				_skin.btn_zidong.visible = !value;
				_skin.btn_tingzhi.visible = value;
			}
			
			if(_zhanqiShowData!=null)
				_zhanqiShowData.isAutoing = value;			
			
			if(_isAutoing != value)
			{
				updateButtonTouchState(false);
				TweenLite.delayedCall(0.1,updateButtonTouchState,[true]);
			}else{
				updateButtonTouchState(true);
			}
			_isAutoing = value;
		}
		private function updateButtonTouchState(bool:Boolean):void
		{
			_skin.btn_kaishi.touchable = bool;
			_skin.btn_zidong.touchable = bool;
			_skin.btn_tingzhi.touchable = bool;
		}
		
		public function hide():void
		{
			TimerServer.remove(showExpAnimation);
		}
	}
}
