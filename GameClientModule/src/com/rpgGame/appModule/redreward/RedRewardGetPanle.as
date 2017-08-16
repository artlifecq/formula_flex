package com.rpgGame.appModule.redreward
{
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.RedRewardSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.RedRewardEvent;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.redreward.bean.RedRewardDataInfo;
	import com.rpgGame.netData.redreward.bean.RedRewardPlayerInfo;
	
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	import gs.easing.Expo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hongbao.HongBao_Chai;
	import org.mokylin.skin.common.Flip1_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	
	public class RedRewardGetPanle extends SkinUIPanel
	{
		private static const pageMaxCellCount:int = 7;
		private var _skin:HongBao_Chai;
		private var _headImg:UIAsset;
		private var _onecellList:Vector.<RedRewardOneCell>;
		private var _moreList:Vector.<RedRewardMoreCell>;
		public function RedRewardGetPanle():void
		{
			_skin = new HongBao_Chai();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_headImg=new UIAsset();
			_headImg.x=105;
			_headImg.y=65;
			_headImg.touchable = false;
			_skin.container.addChild(_headImg);
			var mask:Sprite = new Sprite();
			mask.graphics.drawRect(0,0,this.width,this.height);
			_skin.container.addChildAt(mask,0);
			_skin.container.mask = mask;
			_onecellList = new Vector.<RedRewardOneCell>();
			_moreList = new Vector.<RedRewardMoreCell>();
			_skin.lbItem.leading = 5;
			_skin.lbItem.wordWrap=false;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			EventManager.addEvent(RedRewardEvent.UPDATA_REDREWARDINFO,refeashOpenValue);
			EventManager.addEvent(RedRewardEvent.UPDATA_COUNTINFO,refeashOpenValue);
			EventManager.addEvent(RedRewardEvent.UPDATA_REDREWARDGETINFO,updataRedRewardOpenList);
			refeashOpenValue();
		}
		
		private var _redRewardInfo:RedRewardDataInfo
		private function refeashOpenValue():void
		{
			_skin.uiUp.y = 0;
			_skin.uiDown.y = 227;
			_redRewardInfo = redmgr.redRewardInfo;
			if(_redRewardInfo==null)
			{
				RedRewardSender.reqRewardInfo();
				return ;
			}
			var job:int;
			_skin.grpChai.visible = true;
			if(_redRewardInfo.sendPlayerId.IsZero())
			{
				_skin.lbName.text = "寻秦记红包";
				job = MainRoleManager.actorInfo.job;
			}else{
				_skin.lbName.text = _redRewardInfo.sendPlayerName;
				job = _redRewardInfo.sendPlayerJob;
			}
			
			switch(job){
				case JobEnum.ROLE_1_TYPE:
					this._headImg.styleName="ui/mainui/head/touxiang/bingjia/middle.png";
					break;
				case JobEnum.ROLE_2_TYPE:
					this._headImg.styleName="ui/mainui/head/touxiang/mojia/middle.png";
					break;
				case JobEnum.ROLE_3_TYPE:
					this._headImg.styleName="ui/mainui/head/touxiang/mojia/middle.png";
					break;
				case JobEnum.ROLE_4_TYPE:
					this._headImg.styleName="ui/mainui/head/touxiang/yijia/middle.png";
					break;
			}
			
			if(redmgr.haveRewardCount>0)
			{
				_skin.lbItem.htmlText = HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"发了一个红包");
				_skin.lbVip.visible = false;
				_skin.grpYiJian.visible = !_redRewardInfo.sendPlayerId.IsZero();
				_skin.faBg.height = 33;
			}else{
				_skin.lbItem.htmlText = HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"发了一个红包")+"<br/>"+redmgr.vipInfo.q_desc;
				_skin.grpYiJian.visible = false;
				_skin.lbVip.visible =!redmgr.isMaxVipLevel;
				_skin.faBg.height = 70;
				if(redmgr.rechaged)
				{
					_skin.lbVip.text = "提升vip";
				}else{
					_skin.lbVip.text = "充点小钱玩玩";
				}
			}
			
		}
		
		private function get redmgr():RedRewardManager
		{
			return RedRewardManager.instance();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnChai:
					redmgr.openRedRewardInfo(_skin.cboxTip.isSelected);
					break;
				case _skin.btnContinue:
					refeashOpenValue();
					break;
				case _skin.btnEixt:
					this.hide();
					break;
				case Flip1_Skin(_skin.skinFlip.skin).btnDec:
					refeashPageView(_currentPage-1);
					break;
				case Flip1_Skin(_skin.skinFlip.skin).btnAdd:
					refeashPageView(_currentPage+1);
					break;
				case _skin.lbVip:
					if(redmgr.rechaged)
						AppManager.showApp(AppConstant.VIP_PANEL);
					else
						GlobalFunction.iWantRecharge();
					break;
			}
		}
		private function updataRedRewardOpenList():void
		{
			_skin.grpChai.visible = false;
			_playerInfolist=redmgr.rewardInfoList;
			if(redmgr.isMore==0)
				refeashOneView();
			else
				refeashMoreView();
			_skin.btnContinue.visible = redmgr.canGetReward;
			_skin.btnEixt.visible = !redmgr.canGetReward;
			TweenLite.to(_skin.uiUp,0.3,{y : -184,ease:Expo.easeIn});
			TweenLite.to(_skin.uiDown,0.3,{y : 503,ease:Expo.easeIn});
		}
		
		private var _playerInfolist:Vector.<RedRewardPlayerInfo>;
		private var _totalPage:int;
		private var _currentPage:int;
		private function refeashMoreView():void
		{
			_skin.skinFlip.visible = true;
			_skin.itemgroup.removeChildren();
			for(var i:int = 0;i<pageMaxCellCount;i++)
			{
				var cell:RedRewardMoreCell = getMoreNextCell(i);
				cell.y = 29*i;
				cell.updata(i,_playerInfolist);
				_skin.itemgroup.addChild(cell);
			}
			var count:int = 0;
			var length:int = _playerInfolist.length;
			for(i=0;i<length;i++)
			{
				count +=_playerInfolist[i].count
			}
			_skin.numL.number =  count;
			_totalPage = Math.ceil(_playerInfolist.length/pageMaxCellCount);
			refeashPageView(1);
		}
		
		private function refeashPageView(page:int):void
		{
			if(_currentPage==page)
				return ;
			_currentPage = page;
			Flip1_Skin(_skin.skinFlip.skin).btnDec.visible = _currentPage>1;
			Flip1_Skin(_skin.skinFlip.skin).btnAdd.visible = _currentPage<_totalPage;
			Flip1_Skin(_skin.skinFlip.skin).textDisplay.text = _currentPage.toString()+"/"+_totalPage.toString();
			var startIndex:int = (_currentPage-1)*pageMaxCellCount;
			for(var i:int = 0;i<pageMaxCellCount;i++)
			{
				var cell:RedRewardMoreCell = getMoreNextCell(i);
				cell.updata(i+startIndex,_playerInfolist);
			}
		}
		
		private function refeashOneView():void
		{
			_skin.skinFlip.visible = false;
			_skin.itemgroup.removeChildren();
			_skin.numL.number =  redmgr.selfCount;
			for(var i:int = 0;i<8;i++)
			{
				var cell:RedRewardOneCell = getOneNextCell(i);
				cell.y = 29*i;
				_skin.itemgroup.addChild(cell);
				cell.updata(i,_playerInfolist,_redRewardInfo.sendPlayerId.IsZero());
			}
		}

		
		
		private function getOneNextCell(index:int):RedRewardOneCell
		{
			if(index<_onecellList.length)
				return _onecellList[index];
			
			var cell:RedRewardOneCell = new RedRewardOneCell();
			_onecellList.push(cell);
			return cell;
		}
		
		private function getMoreNextCell(index:int):RedRewardMoreCell
		{
			if(index<_moreList.length)
				return _moreList[index];
			
			var cell:RedRewardMoreCell = new RedRewardMoreCell();
			_moreList.push(cell);
			return cell;
		}
		
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(RedRewardEvent.UPDATA_REDREWARDINFO,refeashOpenValue);
			EventManager.removeEvent(RedRewardEvent.UPDATA_REDREWARDGETINFO,updataRedRewardOpenList);
			EventManager.removeEvent(RedRewardEvent.UPDATA_COUNTINFO,refeashOpenValue);
		}
	}
}