package com.rpgGame.app.view.icon
{
	import com.game.engine3D.display.EffectObject3D;
	import com.game.engine3D.display.Inter3DContainer;
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.clientConfig.Q_tipsinfo;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TipType;
	
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import feathers.controls.UIAsset;
	
	/**
	 *buff图标 
	 * @author dik
	 * 
	 */
	public class BuffIcon extends IconCDFace
	{
		private var _buffData:BuffData;
		private var effectSk:Inter3DContainer;
		private var readyEffect:EffectObject3D;
		private var _isshowbg:Boolean;
		
		/**
		 * @ isshowBG 是否显示CD时的遮罩
		 * */
		public function BuffIcon($iconSize:int=IcoSizeEnum.ICON_19,isShowBG:Boolean=false)
		{
			super($iconSize);
			var txtFormat:TextFormat=new TextFormat(null, 12, 0x8b8d7b, true, null, null, null, null, TextFormatAlign.CENTER);
			this.setIsShowCdTm( true ,txtFormat);
			effectSk=new Inter3DContainer();
			effectSk.x=this.width/2;
			effectSk.y=this.height/2;
			this.addChild(effectSk);
			_isshowbg=isShowBG;
			//this.alwayShowCount=true;
			_showCD=true;
		}
		override public function set count( value:int ):void
		{
			if( value <= 1 &&!alwayShowCount)
			{
				setSubString("");
				return;
			}
			setSubString("x"+value);
		}
		override protected function calIconPos():void
		{
			switch(_iconSize){
				case IcoSizeEnum.ICON_36:
				case IcoSizeEnum.ICON_48:
				case IcoSizeEnum.ICON_42:
					_iconPositionX=_iconPositionY=0;
					break;
			}
		}
		override public function sortLayer():void
		{
			if( _bgImage != null )
			{
				_bgImage.x=-3;
				_bgImage.y=-3;
				addChild( _bgImage );
			}
			
			
			if( _iconImage != null )
				addChild( _iconImage );
			if( effectSk)
			{
				this.setChildIndex(effectSk,this.numChildren-1);
			}
			if (_countText&&_countText.text!="") 
			{
				addChild( _countText );
			}
		}
		
		override protected function onBgImgComplete(uiasset:UIAsset):void
		{
			_bgImage.onImageLoaded=null;
			this._bgImage.width=_iconSize+6;
			this._bgImage.height=_iconSize+6;
			calIconPos();
		}
		
		public function get buffData():BuffData
		{
			return _buffData;
		}
		
		public function set buffData(value:BuffData):void
		{
			_buffData = value;
			this.setIconResName(ClientConfig.getBuffIcon(_buffData.buffData.q_icon, _iconSize ),false);
			if(_isshowbg)
			{
				if(_buffData.buffData.q_effect_type==1) //增益buff
					readyEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.BUFF_ZENGYI));
				else //减益buff 
					readyEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.BUFF_JIANYI));
			}
			//			this.setIconResName(ClientConfig.getItemIcon("101", IcoSizeEnum.ICON_36 ));
			this.count=buffData.curtStackCount;
			sortLayer();
			this.faceInfo=buffData;
			if(value._data.q_buff_id==9||value._data.q_buff_id==10)
			{
				TipTargetManager.remove(this);
				TipTargetManager.show(this, TargetTipsMaker.makeTips( TipType.ACTIVITY_JIXIAN_BUFF_TIP,value));
			}
			else
			{
				var info:Q_tipsinfo=new Q_tipsinfo();
				info.q_describe_tittle=_buffData.buffData.q_buff_name;
				var lostSkiLL:Q_lostskill_open = LostSkillData.getModeInfoById(_buffData.buffData.q_buff_id);
				if(lostSkiLL==null)
				{
					info.q_describe=_buffData.buffData.q_description;
				}else{
					var value1:int = 0;
					if(_buffData.buffInfo.percent>0)
						value1 = _buffData.buffInfo.percent;
					else
						value1 = _buffData.buffInfo.value;
					info.q_describe=lostSkiLL.q_desc.replace("$",LostSkillManager.instance().getValueByType(lostSkiLL.q_type,value1))
				}
				
				TipTargetManager.remove(this);
				TipTargetManager.show(this, TargetTipsMaker.makeTips( TipType.NORMAL_TIP,info));
			}
		}
		
		/**继承的父类名字，是cd完的时候调用*/
		override public function cdComplete() : void
		{
			if(readyEffect!=null)
			{
				readyEffect.stopEffect();
				cdEffectIsPlay=false;
				_now=0;
			}
		}
		
		private var cdEffectIsPlay:Boolean=false;
		private var _now: Number=0;
		override  public function cdUpdate($now : Number, $cdTotal : Number) :void
		{
			//			if (!cdFace || !cdFace.parent)
			//			{
			//				addCdFace();
			//			}
			//			if(cdFace)
			//			{
			//				cdFace.updateTimeTxt($now,$cdTotal);
			//			}
			if($cdTotal>_now)
			{
				_now=$now;
				if(/*!cdEffectIsPlay&&*/readyEffect!=null)
				{
					if(!cdEffectIsPlay)
					{
						
					}
					var pac:Number=$now/$cdTotal;
					readyEffect.gotoPercent(pac);
					cdEffectIsPlay=true;
				}
			}
		}
		
		private function removeEffect() : void
		{
			if(readyEffect!=null)
			{
				readyEffect.removeFromParent();
				readyEffect.dispose();
				readyEffect=null;
			}
			if(effectSk){
				effectSk.removeFromParent();
				effectSk.dispose();
				effectSk=null;
			}
		}
		
		override public function dispose():void
		{
		
			clear();
			removeEffect();
			TipTargetManager.remove(this);
			_buffData=null;
			this.removeFromParent();
			super.dispose();
		}
		
	}
}