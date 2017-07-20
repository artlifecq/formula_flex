package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.TipType;
	
	import away3d.events.Event;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.zuoqi.ZuoqiCont_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;

	public class MountUpExpConent
	{
		private var _skin:ZuoqiCont_Skin;
		private var _itemIconList:Vector.<IconCDFace>;
		public function MountUpExpConent(skin:ZuoqiCont_Skin):void
		{
			_skin = skin;
			super();
			initView();
		}
		private function initView():void
		{
			_itemIconList = new Vector.<IconCDFace>();
			var partner:DisplayObjectContainer = _skin.grid_1.parent;
			var icon:IconCDFace = IconCDFace.create(IcoSizeEnum.ICON_42);
			icon.bindBg(_skin.grid_1);
			_itemIconList.push(icon);
			partner.addChild(icon);
			icon = IconCDFace.create(IcoSizeEnum.ICON_42);
			icon.bindBg(_skin.grid_2);
			_itemIconList.push(icon);
			partner.addChild(icon);
			_skin.chk_zidonggoumai.addEventListener(Event.CHANGE,checkChangeHandler);
		}
		
		private function checkChangeHandler():void
		{
			_mountShowData.isAutoBuyItem = _skin.chk_zidonggoumai.isSelected;
		}
		private var _mountShowData:MountShowData;
		public function updataInfo(mountShowData:MountShowData):void
		{
			_mountShowData = mountShowData;
			_skin.chk_zidonggoumai.isSelected = _mountShowData.isAutoBuyItem;
			this.isAutoing = _mountShowData.isAutoing;
			
			if(!_mountShowData.isMaxLevel)
			{
				_skin.grp_jinjie.visible = true;
				_skin.maximg.visible = false;
				_skin.lab_xuyaowupin.htmlText = _mountShowData.upLevelItem.name+"*"+_mountShowData.upLevelNeedItemCount;
				if(_mountShowData.canUpLevel())
				{
					_skin.lab_xuyaowupin.color = 0x5DBD37;
				}else{
					_skin.lab_xuyaowupin.color = 0xd02525;
				}
				_skin.uplevelgroup.visible = true;
				const housedata:Q_horse = _mountShowData.housedata;
				if(_mountShowData.haveChange)
				{
					var rewards:Vector.<ClientItemInfo> = _mountShowData.rewardItems;
					for(var index:int = 0;index<rewards.length;index++)
					{
						_itemIconList[index].visible = true;
						FaceUtil.SetItemGrid(_itemIconList[index], rewards[index], true);
					}
					for(;index<_itemIconList.length;index++)
					{
						_itemIconList[index].visible = false;
					}
					if(_mountShowData.needClearExp())
					{
						_skin.lab_zhufuzhi.text = "本阶祝福值不清零";
						_skin.lab_zhufuzhi.color = 0x5cb006;
					}else{
						_skin.lab_zhufuzhi.text = "祝福值每日0点清零";
						_skin.lab_zhufuzhi.color = 0xe1201c;
					}
				}
				const percent:Number = _mountShowData.percent;
				_skin.progressbar.value = _skin.progressbar.maximum*percent;
				_skin.lab_progressbar.text = _mountShowData.exp.toString()+"/"+housedata.q_blessnum_limit.toString();
				TipTargetManager.remove(_skin.expgroup);
				TipTargetManager.show(_skin.expgroup,TargetTipsMaker.makeTips(TipType.BLESS_TIP,_mountShowData));
			}else{
				_skin.grp_jinjie.visible = false;
				_skin.uplevelgroup.visible = false;
				_skin.maximg.visible = true;
			}
		}
		
		public function updateExp(exp:int,count:int):void
		{
			var changeExp:int=exp-_skin.progressbar.value;
			if(changeExp==0){
				return;
			}
			var addExp:int=changeExp/count;
			TimerServer.addLoop(showExpAnimation,25,[addExp],count);
			_skin.progressbar.maximum =_mountShowData.housedata.q_blessnum_limit;
		}
		
		private function showExpAnimation(exp:int):void
		{
			_skin.progressbar.value += exp;
			_skin.lab_progressbar.text =_skin.progressbar.value+"/"+_skin.progressbar.maximum;
		}
		
		private var _isAutoing:Boolean;
		public function set isAutoing(value:Boolean):void
		{
			if(_mountShowData.isMaxLevel)
			{
				value = false;
			}else{
				_skin.btn_kaishi.visible = !value;
				_skin.btn_zidong.visible = !value;
				_skin.btn_tingzhi.visible = value;
				
			}
			
			if(_mountShowData!=null)
				_mountShowData.isAutoing = value;
			
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
	}
}