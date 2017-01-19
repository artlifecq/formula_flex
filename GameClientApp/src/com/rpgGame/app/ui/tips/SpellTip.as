package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.SpellManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.TextSizeUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.Label;
	
	import org.mokylin.skin.app.tips.SpellTipsSkin;
	
	import starling.display.DisplayObject;
	
	/**
	 * 技能TIPS
	 * @author luguozheng
	 * @author 陈鹉光-2016-07-13 改
	 * 
	 */	
	public class SpellTip extends SkinUI implements ITip
	{
		private var _spellTip:Object;//SpellTipsSkin;
		/** 技能proto **/
		private var spellProto:Q_skill_model;
		/** 头部技能图标icon **/
		private var titleIconFace:IconCDFace;
		/** 底部技能图标icon 1 **/
		private var buttomIconFace1:IconCDFace;
		/** 底部技能图标icon 2 **/
		private var buttomIconFace2:IconCDFace;
		/** 底部技能图标icon 3 **/
		private var buttomIconFace3:IconCDFace;
		/** 关联推荐技能 **/
		private var spellArr:Array = [];
		
		private static var _instance:SpellTip = null;
		public static function get instance() : SpellTip
		{
			if (null == _instance)
			{
				_instance = new SpellTip();
			}
			return _instance;
		}
		
		public function SpellTip()
		{
			_spellTip = new SpellTipsSkin();
			super( _spellTip );
			
			initTip();
		}
		
		/**
		 * 初始化tips 
		 * 
		 */		
		private function initTip():void
		{
			titleIconFace = FaceUtil.creatIconCDFaceByUIAsset( _spellTip.imgIcon, 46, 0 );
			buttomIconFace1 = FaceUtil.creatIconCDFaceByUIAsset( _spellTip.imgIcon1, 46, 0 );
			buttomIconFace2 = FaceUtil.creatIconCDFaceByUIAsset( _spellTip.imgIcon2, 46, 0 );
			buttomIconFace3 = FaceUtil.creatIconCDFaceByUIAsset( _spellTip.imgIcon3, 46, 0 );
			
			_spellTip.labUseDec.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO1 );
			_spellTip.labTishi.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO3 );
		}		
		
		/**
		 * 设置技能tips数据 
		 * @param data
		 * 
		 */		
		public function setTipData( data:* ):void
		{
			var base:BaseFaceInfo = data as BaseFaceInfo;
			spellProto = base.data;
			
			if( spellProto == null )
				return;
			
			updateTipsIcon();
			
			if( spellProto == null )
			{
				//被动
				_spellTip.labUseDec.visible = false;
				_spellTip.labCurDis.visible = false;
				_spellTip.labTishi.visible = false;
			}
			else
			{
				_spellTip.labUseDec.visible = true;
				_spellTip.labCurDis.visible = true;
				_spellTip.labTishi.visible = true;
				
				_spellTip.labCurDis.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO2, spellProto.q_range_limit / 50);
			}
			
			var isLearn:Boolean = MainRoleManager.actorInfo.spellList.hasTypeSpell( spellProto.q_skillID );//是否学习过了
			if( isLearn )
			{
				//学习过了
				_spellTip.labCurNeedLevel.visible = true;
				_spellTip.labCurDec.visible = true;
//				_spellTip.labCurNeedLevel.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO4, spellProto.learnLevel );
//				var curDescription:String = getDescription( spellProto.q_, spellProto.additionalOriginValue, spellProto.beenAdditionalSpellType );
//				_spellTip.labCurDec.htmlText = curDescription;//被什么加成的，动态设置
//				_spellTip.labCurDec.height = TextSizeUtil.getTextHeght( curDescription, _spellTip.labCurDec.width ) + 10;
//				
				if( spellProto != null )
				{
					//主动技能才有CD，魔法消耗
					_spellTip.labCurCD.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO5, spellProto.q_cd / 1000 );
					_spellTip.labCurMagic.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO6, spellProto.q_need_mp );
					_spellTip.labCurCD.visible = true;
					_spellTip.labCurMagic.visible = true;
				}
				else
				{
					_spellTip.labCurCD.visible = false;
					_spellTip.labCurMagic.visible = false;
				}
			}
			else
			{
				_spellTip.labCurNeedLevel.visible = false;
				_spellTip.labCurCD.visible = false;
				_spellTip.labCurMagic.visible = false;
				_spellTip.labCurDec.visible = false;
			}
			
//			var isFull:Boolean = ( spellProto.nextSpell == null );//是否满级了
//			if( isFull )
//			{
//				showAndHideNext( false );
//				_spellTip.labNextLevelTitle.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO14 );
//				_spellTip.imgBG.height = getSpellTipsHeight() + 10;
//				return;
//			}
//			
//			var nextSpellProto:NextSpellProto = spellProto.nextSpell;
//			if( nextSpellProto == null )
//				return;
//			
//			showAndHideNext( true );
			
//			_spellTip.labNextLevelTitle.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO7 );
//			_spellTip.labNextSpellLevel.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO8, isLearn ? spellProto.spellLevel + 1 : 1 );
			
//			if( nextSpellProto.canLearnLevel <= MainRoleManager.actorInfo.totalStat.level )
//				_spellTip.labNextNeedLevel.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO4, nextSpellProto.canLearnLevel ) );
//			else
//				_spellTip.labNextNeedLevel.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO4, nextSpellProto.canLearnLevel ) );
			
//			var nextDescription:String = getDescription( nextSpellProto.description, nextSpellProto.additionalOriginValue, spellProto.beenAdditionalSpellType );
//			_spellTip.labNextDec.htmlText = nextDescription;//被什么加成的，动态设置
//			_spellTip.labNextDec.height = TextSizeUtil.getTextHeght( nextDescription, _spellTip.labNextDec.width ) + 10; 
			
			//----------------------------职业类型
//			if( spellProto.race != 0 )
//				_spellTip.labWeapenType.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO12, RaceUtil.getRaceTitle( spellProto.race ) );
//			else
//				_spellTip.labWeapenType.visible = false;
			
			//----------------------------升级加点所需
			if( SpellManager.isHasSpellPoint() )
				_spellTip.labSpellPoint.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO11, 1 ) );
			else
				_spellTip.labSpellPoint.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO11, 1 ) );
			
			//--------------------------------------前提技能之和
//			var raceSpellAll:int = SpellDataManager.getCategoryCostSpellPoint( spellProto.spellType );
//			if( raceSpellAll > 0 )
//			{
//				if( raceSpellAll <= SpellManager.getIndexLearnAllPoint( spellProto.spellType ) )
//					_spellTip.labRaceSpellAllPoint.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO16, raceSpellAll ) );
//				else
//					_spellTip.labRaceSpellAllPoint.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO16, raceSpellAll ) );
//			}
//			else
//				_spellTip.labRaceSpellAllPoint.visible = false;
			
			//--------------------------------------货币类消耗
//			var cost:UpgradeProtoInfo = new UpgradeProtoInfo();
//			cost.setProto( nextSpellProto.learnCost );
//			
//			if( cost.amountInfo.getAmountByType( AmountType.BAND_MONEY ) > 0)
//			{
//				if( UpgradeUtil.isSomeMoneyEnough( AmountType.BAND_MONEY , cost.amountInfo.getAmountByType( AmountType.BAND_MONEY ) ) )
//					_spellTip.labMoney.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO9, MoneyUtil.getHtmlMoneyString( cost.amountInfo.getAmountByType( AmountType.BAND_MONEY ) ) ) );
//				else
//					_spellTip.labMoney.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO9, MoneyUtil.getHtmlMoneyString( cost.amountInfo.getAmountByType( AmountType.BAND_MONEY ) ) ) );
//			}
//			else
//			{
//				_spellTip.labMoney.visible = false;
//			}
//			
//			if( cost.amountInfo.getAmountByType( AmountType.EXP ) > 0)
//			{
//				if( UpgradeUtil.isSomeMoneyEnough( AmountType.EXP , cost.amountInfo.getAmountByType( AmountType.EXP ) ) )
//					_spellTip.labExp.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO10, cost.amountInfo.getAmountByType( AmountType.EXP ) );
//				else
//					_spellTip.labExp.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO10, cost.amountInfo.getAmountByType( AmountType.EXP ) ) );
//			}
//			else
//			{
//				_spellTip.labExp.visible = false;
//			}
			
			//--------------------------------------物品，有无技能书
//			var itemID:int = cost.getFristItemCfgid();
//			if( itemID <= 0 )
//			{
//				_spellTip.labBook.visible = false;
//				//_spellTip.labBook.htmlText = HtmlTextUtil.getGreenText( LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO13, LanguageConfig.getText( LangMisc.NOTHING_INFO ) ) );
//			}
//			else
//			{
//				if( BackPackManager.instance.getFirstCanUseItemByCfgId( itemID ) != null )
//					_spellTip.labBook.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO13, cost.getFristItemName() ) );
//				else
//					_spellTip.labBook.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO13, cost.getFristItemName() ) );
//			}
			
			//--------------------------------------物品，是否学习了前置技能
//			var preSpellType:int = SpellDataManager.getPreSpellType( spellProto.spellType );
//			if( preSpellType <= 0 )
//			{
//				_spellTip.labPreSpell.visible = false;
//			}
//			else
//			{
//				var preSpellProto:SpellProto = SpellDataManager.getSpellData( preSpellType );
//				var preSpellLevel:int = SpellDataManager.getPreSpellLevel( spellProto.spellType );
//				if( preSpellProto != null )
//				{
//					if( MainRoleManager.actorInfo.spellList.hasTypeSpell( preSpellType ) && MainRoleManager.actorInfo.spellList.getSpell( preSpellType ).learnLevel >= preSpellLevel )
//						_spellTip.labPreSpell.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_15, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO15, preSpellProto.name, preSpellLevel ) );
//					else
//						_spellTip.labPreSpell.htmlText = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO15, preSpellProto.name, preSpellLevel ) );
//					_spellTip.labPreSpell.visible = true;
//				}
//				else
//				{
//					_spellTip.labPreSpell.visible = false;
//				}
//			}
			
			//--------------------------------------
			_spellTip.labNextSpellLevel.y = _spellTip.labNextLevelTitle.y + 20;
			_spellTip.labNextNeedLevel.y = _spellTip.labNextSpellLevel.y + 20;
			
			if( spellProto == null )
			{
				//被动
				_spellTip.labNextCD.visible = false;
				_spellTip.labNextMagic.visible = false;
				_spellTip.labNextDec.y = _spellTip.labNextNeedLevel.y + 20;
			}
			else
			{
				//主动
//				_spellTip.labNextCD.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO5, nextSpellProto.nextActiveSpell.cd / 1000 );
//				_spellTip.labNextMagic.htmlText = LanguageConfig.getText( LangSpell.SPELL_TIPS_INFO6, nextSpellProto.nextActiveSpell.manaCost );
//				_spellTip.labNextCD.visible = true;
//				_spellTip.labNextMagic.visible = true;
//				_spellTip.labNextCD.y = _spellTip.labNextNeedLevel.y + 20;
//				_spellTip.labNextMagic.y = _spellTip.labNextCD.y + 20; 
//				_spellTip.labNextDec.y = _spellTip.labNextMagic.y + 20;
			}
			//tips高度
			_spellTip.imgBG.height = getSpellTipsHeight() + 10;
		}
		
		/**
		 * 获取技能tips背景高度 
		 * @return 
		 * 
		 */		
		private function getSpellTipsHeight():int
		{
			var tipsH:int;
			var index:int;
			var display:DisplayObject;
			var lab:Label;
			
			//计算groupTitle的高度
			var groupTitleH:int = _spellTip.groupTitle.height;
			
			//计算groupDesc的高度
			var groupDescH:int;
			for ( index = 0; index < _spellTip.groupDesc.numChildren; index++)
			{
				display = _spellTip.groupDesc.getChildAt( index );
				if ( display && display.visible == true )
				{
					if( display is Label )//重新计算lab的真实高度
					{
						lab = display as Label;
						display.height = TextSizeUtil.getTextHeght( lab.htmlText, lab.width, 14 );
						display.y = groupDescH;
					}
					groupDescH += display.height;
				}
			}
			_spellTip.groupDesc.y = _spellTip.groupTitle.y + _spellTip.groupTitle.height + 10;
			
			//计算groupNeed的高度
			var groupNeedH:int;
			for ( index = 0; index < _spellTip.groupNeed.numChildren; index++)
			{
				display = _spellTip.groupNeed.getChildAt( index );
				if ( display && display.visible == true )
				{
					if( display is Label )//重新计算lab的真实高度
					{
						lab = display as Label;
						display.height = TextSizeUtil.getTextHeght( lab.htmlText, lab.width, 14 );
						display.y = groupNeedH;
					}
					groupNeedH += display.height;
				}
			}
			_spellTip.groupNeed.y = _spellTip.groupDesc.y + groupDescH + 10;
			
			//计算groupButtom的高度
			var groupButtomH:int = _spellTip.groupButtom.height;
			_spellTip.groupButtom.y = _spellTip.groupNeed.y + groupNeedH + 10;
			
			
			//如果关联推荐的数据为空，就说明这个技能不需要显示推荐的数据
			if( spellArr != null && spellArr.length > 0 )
			{
				_spellTip.groupButtom.visible = true;
				tipsH = groupTitleH + groupDescH + groupNeedH + groupButtomH + 40;
			}
			else
			{
				_spellTip.groupButtom.visible = false;
				tipsH = groupTitleH + groupDescH + groupNeedH + 40;
			}
			
			return tipsH;
		}
		
		/**
		 * 更新tips的所有的技能icon显示 
		 * 
		 */		
		private function updateTipsIcon():void
		{
			//技能右上角的图标类型
			var charType:int = spellProto.q_trigger_type;
			var res:String = ClientConfig.getSpellTipsCharTypeById( charType );
			_spellTip.imgChar.styleName = res;
			_spellTip.labName.htmlText = spellProto.q_skillName;
			
			//头部技能icon
			FaceUtil.SetSkillGrid( titleIconFace, FaceUtil.chanceSpellToFaceInfo( spellProto ), true );
			
			//底部技能icon，左边中间的那个icon
//			FaceUtil.SetSkillGrid( buttomIconFace1, FaceUtil.chanceSpellToFaceInfo( spellProto ), true );
//			_spellTip.labName1.htmlText = spellProto.name;
//			
//			spellArr = spellProto.clientSuggestSpellId;
//			if( spellArr != null && spellArr.length > 0 )
//			{
//				var spellRaceArr:Array = SpellDataManager.getRemainingSpellDataByRace( spellProto.race );
//				if( spellRaceArr == null || spellRaceArr.length <= 0 )
//					return;
//				for (var i:int = 0; i < spellRaceArr.length; i++) 
//				{
//					var spellCategoryLearnProto:SpellCategoryLearnProto = spellRaceArr[i];
//					var arr:Array = spellCategoryLearnProto.spells;
//					for (var j:int = 0; j < arr.length; j++) 
//					{
//						var spellLearnPro:SpellLearnProto = arr[j] as SpellLearnProto;
//						if( spellLearnPro != null )
//						{
//							var id:int = spellLearnPro.spell.spellType;
//							
//							//底部技能icon，右边上面的icon
//							if( id == spellArr[0] )
//							{
//								var skillData2:SpellProto = spellLearnPro.spell;//SpellDataManager.getSpellData( spellArr[0] );
//								if ( skillData2 != null )
//								{
//									FaceUtil.SetSkillGrid( buttomIconFace2, FaceUtil.chanceSpellToFaceInfo( skillData2 ), true );
//									_spellTip.labName2.htmlText = skillData2.name;
//								}
//							}
//							
//							//底部技能icon，右边下面的icon
//							if( id == spellArr[1] )
//							{
//								var skillData3:SpellProto = spellLearnPro.spell;//SpellDataManager.getSpellData( spellArr[1] );
//								if ( skillData3 != null )
//								{
//									FaceUtil.SetSkillGrid( buttomIconFace3, FaceUtil.chanceSpellToFaceInfo( skillData3 ), true );
//									_spellTip.labName3.htmlText = skillData3.name;
//								}
//							}
//						}
//					}
//				}
//			}
		}
		
		/**
		 * 显示、隐藏 
		 * @param isShow
		 * 
		 */		
		private function showAndHideNext( isShow:Boolean ):void
		{
			_spellTip.labNextSpellLevel.visible = isShow;
			_spellTip.labNextNeedLevel.visible = isShow;
			_spellTip.labNextCD.visible = isShow;
			_spellTip.labNextMagic.visible = isShow;
			_spellTip.labNextDec.visible = isShow;
			_spellTip.labMoney.visible = isShow;
			_spellTip.labExp.visible = isShow;
			_spellTip.labSpellPoint.visible = isShow;
			_spellTip.labWeapenType.visible = isShow;
			_spellTip.labPreSpell.visible = isShow;
			_spellTip.labBook.visible = isShow;
			_spellTip.labRaceSpellAllPoint.visible = isShow;
		}
		
		/**
		 * 获取描述信息 
		 * @param description
		 * @param self
		 * @param preSpellType
		 * @return 
		 * 
		 */		
		private function getDescription( description:String, self:int, preSpellType:int ):String
		{
			if( preSpellType <= 0 )
				return description;
			
			var selfValue:int = self;
			var addValue:int = 0;
			var spellName:String = "";
			
//			var spellProto:SpellProto = MainRoleManager.actorInfo.spellList.getSpell( preSpellType );
//			if( spellProto == null )
//			{
//				addValue = 0;
//				spellProto = SpellDataManager.getSpellData( preSpellType );
//			}
//			else
//			{
//				addValue = self * ( 1 / 100 );
//			}
//			
//			if( spellProto != null )
//				spellName = spellProto.name;
			
			var count:int = selfValue + addValue;
			var info:String = LanguageConfig.getText( LangSpell.SPELL_TIPS_DESCR, selfValue, spellName, addValue );
			info = replaceStr( description, "@", info );
			info = replaceStr( info, "$", count, count, count, count, count );
			
			return info;
		}
		
		/**
		 * 文本内容替换 
		 * @param str
		 * @param repStr
		 * @param args
		 * @return 
		 * 
		 */		
		public function replaceStr( str:String, repStr:String, ... args) : String
		{
			if (args != null && args.length > 0 && str != null)
			{
				var i : int;
				var len : int = args.length;
				for (i = 0; i < len; i++)
				{
					str = str.replace( repStr, args[i] );
				}
			}
			return str;
		}
		
		/**
		 * 隐藏技能tips 
		 * 
		 */		
		public function hideTips():void
		{
			
		}
		
		/**
		 * 获取技能tips高度 
		 * @return 
		 * 
		 */		
		override public function get height():Number
		{
			return _spellTip.imgBG.height;
		}
	}
}