package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.utils.HeadBloodUtil;
	import com.rpgGame.app.utils.Render3DTextUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.AttachDisplayType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.utils.getTimer;
	
	import app.message.MonsterDataProto.MonsterType;
	
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.themes.GuiTheme;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.DisplayObject;

	/**
	 *
	 * 头部表现
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-10 上午11:12:28
	 *
	 */
	public class HeadFace extends BaseHeadFace
	{
		private static var headFacePool : InstancePool = new InstancePool("headFacePool", 300);

		/**
		 * 生成一个HeadFace
		 */
		public static function create(role : SceneRole) : HeadFace
		{
			//利用池生成HeadFace
			return headFacePool.createObj(HeadFace, role) as HeadFace;
		}

		/**
		 * @private
		 * 回收一个HeadFace
		 * @param headFace
		 */
		public static function recycle(headFace : HeadFace) : void
		{
			//利用池回收HeadFace
			headFacePool.disposeObj(headFace);
		}

		public static const UPDATE_HEAD_FIGHT_INFO : String = "updateHeadFightInfo";
		/**信息条的宽度**/
		public static const WIDTH : uint = 70;
		
		private var _nameBar : HeadNameBar;
		//		private var _countryNameBar : HeadNameBar;2017年1月4日10:26:07 优化本国玩家不需要显示国家名，并且放到nameBar里面
		/**军衔*/
		private var _junXianBar : HeadNameBar;
		
		/** 血条*/
		private var _bloodBar : HeadBloodBar;
		private var _bloodPercent : Number = 1;
		
		/**官职图标*/
		private var _office : InterObject3D;
		
		private var _guildNameBar : HeadNameBar;
		private var _familNameBar : HeadNameBar;
		/** 图标图片*/
		private var _icoImage : UIAsset;
		/**心情动画*/
		private var _moodMC : UIMovieClip;
		
		/**称号*/
		private var _title : InterObject3D;
		
		private var _moodTween : TweenLite;

		/** body图标*/
		private var _bodyImage : UIAsset;
		/** 人物头顶特效 **/
		private var _effectGroup : HeadFaceEffectGroup;
		
		/**国战图标*/
		private var _countryWarIcon : UIAsset;
		/**旗子图标*/
		private var _biaoFlagIcon : UIAsset;
		
		private var _familyWarIcon : UIAsset;
		
		/**各种头顶信息的Y坐标*/
		public var offsetY : int = 0;
		/**头顶鲜花显示的坐标*/
		public var flowerY : int = 0;
		private var showBloodTween:TweenLite;

		public function HeadFace(role : SceneRole)
		{
			super();
			_bloodPercent = 1;
			reSet([role]);
		}

		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_role = $parameters[0] as SceneRole;
			_effectGroup = new HeadFaceEffectGroup(_role);
			_isSelected = false;
			_isCamouflage = false;
			setTemporary();
		}
		//---------------------------------------------
		//---------------------------------------------
		/**
		 * 初始化添加的元素
		 *
		 */
		override protected function initAddBar() : void
		{
			switch (_role.type)
			{
				case SceneCharType.PLAYER:
					addAndUpdateHP();
					addAndUpdateName();
					addAndUpdateGuildName();
					addAndUpdateOfficeName();
					//addAndUpdateFamilyName();//暂无家族
					break;
				case SceneCharType.NPC:
				case SceneCharType.PROTECT_NPC:
				case SceneCharType.MONSTER:
//				case SceneCharType.FAMILY_WAR_FLAG:
//				case SceneCharType.SUMMON_MONSTER:
				case SceneCharType.LIANG_CANG:
//				case SceneCharType.SHI_BEI:
				case SceneCharType.COLLECT:
				case SceneCharType.BIAO_CHE:
				case SceneCharType.DROP_GOODS:
				case SceneCharType.MOUNT:
				case SceneCharType.STALL:
				case SceneCharType.ZHAN_CHE:
					addAndUpdateHP();
					addAndUpdateName();
					break;
//				case SceneCharType.RACING_HERO:
//				case SceneCharType.ROBOT:
					addAndUpdateName();
					break;
			}
		}

		/**
		 * 由于模型未加载之前是在别的容器中，所以加载完成后要重新更新一下加到真正的容器之中
		 *
		 */
		override protected function addAllBar() : void
		{
			//更新一下容器，从临时的到模型真正容器
//			addElement(_bloodBar);
			addElement(_nameBar);
			//			addElement(_countryNameBar);
			addElement(_junXianBar);
			addElement(_guildNameBar);
			addElement(_familNameBar);
			addElement(_icoImage);
			addElement(_bodyImage);
			addElement(_title);
			addElement(_office);
			addElement(_countryWarIcon);
			addElement(_biaoFlagIcon);
			addElement(_familyWarIcon);
			addElement(_moodMC);
		}

		//---------------------------------------------
		override protected function updateShowAndHide() : void
		{
			var nameVisible : Boolean = _role.getAttachVisible(AttachDisplayType.ROLE_HEAD_NAME);
			if (_role.type == SceneCharType.NPC) //NPC，不管是否被选中都显示
			{
				showAndHideElement(_nameBar, nameVisible);
				showAndHideElement(_icoImage, true);
			}
			else if (_role.type == SceneCharType.PROTECT_NPC) //保护npc，全显示或者全隐藏
			{
				showAndHideElement(_nameBar, _isSelected && nameVisible);
				showAndHideElement(_bloodBar, _isSelected);
			}
			else if (_role.type == SceneCharType.MONSTER) //怪物，全显示或者全隐藏
			{
			/*	var monster:Q_monster=MonsterDataManager.getData((_role.data as MonsterData).modelID);
				//普通怪在战斗状态显示血条
				if(monster.q_monster_type==MonsterType.NORMAL&&(_isSelected||(_role.stateMachine&&(_role.stateMachine.isAttacking||_role.stateMachine.isHiting)))){
					showAndHideElement(_bloodBar, true);
				}*/
				
				showAndHideElement(_nameBar, _isSelected && nameVisible);
			}
//			else if (_role.type == SceneCharType.SUMMON_MONSTER) //召唤怪物，全显示或者全隐藏
//			{
//				showAndHideElement(_nameBar, nameVisible);
//				return;
//			}
			else if (_role.type == SceneCharType.ZHAN_CHE) //战车
			{
				showAndHideElement(_nameBar, true);
				showAndHideElement(_bloodBar, true);
			}
//			else if (_role.type == SceneCharType.ROBOT) //机器人
//			{
//				showAndHideElement(_nameBar, true);
//			}
			else if (_role.type == SceneCharType.LIANG_CANG) //怪物，全显示或者全隐藏
			{
				showAndHideElement(_nameBar, _isSelected && nameVisible);
				return;
			}
			else if (_role.type == SceneCharType.STALL) //摆摊
			{
				showAndHideElement(_nameBar, nameVisible);
			}
//			else if (_role.type == SceneCharType.RACING_HERO) //赛马
//			{
//				showAndHideElement(_nameBar, nameVisible);
//			}
			else if (_role.type == SceneCharType.BIAO_CHE) //镖车
			{
				showAndHideElement(_icoImage, true);
			}
			else if (_role.type == SceneCharType.PLAYER) //玩家
			{
				if (_role.isMainChar) //自己
				{
					//显示血条、称号、昵称
					showAndHideElement(_nameBar, nameVisible && !_isCamouflage);
					showAndHideElement(_guildNameBar, !_isCamouflage);
					showAndHideElement(_familNameBar, !_isCamouflage);
					showAndHideElement(_bloodBar, true);
				}
				else
				{
					showAndHideElement(_bodyImage, !_isCamouflage);
					//名字、称号
					showAndHideElement(_nameBar, nameVisible && !_isCamouflage);
					
					//选中显示
					//showAndHideElement( _bloodBar, _isSelected );
//					showAndHideElement(_bloodBar, true);
					showAndHideElement(_guildNameBar, _isSelected && !_isCamouflage);
					showAndHideElement(_familNameBar, _isSelected && !_isCamouflage);
				}
				showAndHideElement(_title, !_isCamouflage);
				showAndHideElement(_office, !_isCamouflage);
			}
			showAndHideElement(_junXianBar, _nameBar && _nameBar.parent && _nameBar.visible);
			//			showAndHideElement(_countryNameBar, _nameBar && _nameBar.parent && _nameBar.visible);
			showAndHideElement(_biaoFlagIcon, _nameBar && _nameBar.parent && _nameBar.visible);
			showAndHideElement(_countryWarIcon, _nameBar && _nameBar.parent && _nameBar.visible);
			showAndHideElement(_familyWarIcon, _nameBar && _nameBar.parent && _nameBar.visible);
			showAndHideElement(_moodMC, true);
		}
		
		private function sortAttackFace():void
		{
			var list:Array=[];
			 var i:int=0;
			for(i;i<this.numChildren;i++){
				 var a:DisplayObject=this.getChildAt(i);
				if(a is AttackFace){
					list.push(a);
				}
			}
			for(i;i<list.length;i++){
				this.addChild(list[i]);
			}
		}
		
		public function updateAllPosition() : void
		{
			updateAllBarPosition();
		}

		//---------------------------------------------
		//---------------------------------------------更新位置
		/**
		 * 更新血条等位置
		 * @param isTemporary		是否是临时的模型未加载时
		 *
		 */
		override protected function updateAllBarPosition() : void
		{
			//不管是临时，还是模型加载完成的，这是不能为NULL
			
			var startPosy : int = 0; //不是临时的，说明模型那么就按名字绑定点就好了
			if (isTemporary)
			{
				//临时的或都模型没有血条的那么这就是固定值，从脚底再加上这个值的位置
				startPosy = -100;
			}
			
			var upPosy : int = startPosy;
			var downPosy : int = 0;
			offsetY = startPosy;
			
			if (_bloodBar != null) //血条位置
			{
				_bloodBar.x = -_bloodBar.realWidth * 0.5;
				_bloodBar.y = upPosy - _bloodBar.realHeight;
				upPosy = _bloodBar.y - _bloodBar.textHeight;
			}
			
			//玩家名字为标准位置
			if (_nameBar != null) //名字位置
			{
				_nameBar.x = int(-_nameBar.realWidth * 0.5);
				_nameBar.y = int(upPosy - _nameBar.realHeight);
				upPosy = _nameBar.y;
				offsetY = _nameBar.y;// - _nameBar.realHeight
				downPosy = _nameBar.y + _nameBar.realHeight;
			}
			//			if (_countryNameBar != null)
			//			{
			//				_countryNameBar.x = _nameBar.x + _nameBar.realWidth;
			//				_countryNameBar.y = _nameBar.y;
			//			}
			if (_junXianBar != null)
			{
				_junXianBar.x = -_junXianBar.width / 2;
				_junXianBar.y = offsetY - _junXianBar.realHeight;
				offsetY = _junXianBar.y;
			}
			if (_title && _title.parent)
			{
				_title.x = 0;
				_title.y = offsetY - 30;
				offsetY = _title.y;
			}
			
			if (_office && _office.parent) //官职
			{
				_office.x = 0;
				_office.y = offsetY - 40;
				offsetY = _office.y;
			}
			
			if (_countryWarIcon != null)
			{
				_countryWarIcon.x = _nameBar.x - _countryWarIcon.width;
				_countryWarIcon.y = _nameBar.y + (_nameBar.height - _countryWarIcon.height) / 2;
				//trace("!!!!!!updateAllBarPosition:", _countryWarIcon.styleName, _nameBar.height, _countryWarIcon.height);
			}
			if (_biaoFlagIcon != null)
			{
				_biaoFlagIcon.x = _nameBar.x - _biaoFlagIcon.width;
				_biaoFlagIcon.y = _nameBar.y + (_nameBar.height - _biaoFlagIcon.height) / 2;
			}
			if (_familyWarIcon != null)
			{
				_familyWarIcon.x = _nameBar.x - _familyWarIcon.width;
				_familyWarIcon.y = _nameBar.y + (_nameBar.height - _familyWarIcon.height) / 2;
				//trace("!!!!!!updateAllBarPosition:", _familyWarIcon.styleName, _nameBar.height, _familyWarIcon.height);
			}
			if (_icoImage) //任务图标
			{
				_icoImage.x = -_icoImage.width / 2;
				_icoImage.y = upPosy - _icoImage.height;
				upPosy = _icoImage.y;
			}
			if (_moodMC && _moodMC.parent) //心情动画
			{
				var mcWidth : int = 56;
				var mcHeight : int = 56;
				_moodMC.x = -mcWidth / 2;
				_moodMC.y = _nameBar.y - mcHeight;
			}
			flowerY = effectGroup.layout();
//			Render3DTextUtil.refreshHeadFlowerTextLayout(_role); //原来的
			Render3DTextUtil.addHeadFlowerTextToTarget(_role);
			//-------------------------------------
			//玩家名字之下的
			
			if (_guildNameBar != null && _guildNameBar.text != "")
			{
				_guildNameBar.x = -_guildNameBar.width / 2;
				_guildNameBar.y = downPosy;
				downPosy = _guildNameBar.y + _guildNameBar.realHeight;
			}
			
			if (_familNameBar != null && _familNameBar.text != "")
			{
				_familNameBar.x = -_familNameBar.width / 2;
				_familNameBar.y = downPosy;
				downPosy = _familNameBar.y + _familNameBar.realHeight;
			}
			
			if (_bodyImage != null)
			{
				_bodyImage.x = upPosy - _bodyImage.width;
				_bodyImage.y = upPosy - _bodyImage.height;
			}
			
			//-------------------更新显示隐藏状态
			updateShowAndHide();
		}

		//---------------------------------------------血条
		/**
		 * 添加且更新血条
		 */
		private function addAndUpdateHP() : void
		{
			if (_role.type == SceneCharType.NPC)
				return;

			if (_bloodBar == null)
			{
				//原来没有血条添加一个
				_bloodBar = HeadBloodBar.create(_role);
//				_bloodBar.state = HeadBloodUtil.getRoleBloodState( _role );
//				this.addChild(_bloodBar); //更新一下容器，从临时的到模型真正容器
			}
			//更新一下数据
			_bloodBar.update(_bloodPercent);
		}

		/**
		 * 设置血条状态，由HeadBloodStateType枚举
		 * @param value
		 * 
		 */
		public function set bloodState(value:int):void
		{
			if (_bloodBar)
			{
				_bloodBar.state = value;
			}
		}

		public function set bloodPercent(value : Number) : void
		{
			if (_bloodPercent == value)
				return;

			_bloodPercent = value;
			if (_bloodBar)
			{
				_bloodBar.update(_bloodPercent);
				if(showBloodTween){
					showBloodTween.kill();
					showBloodTween=null;
				}
			}

			if (_isSelected)
			{
				EventManager.dispatchEvent(UPDATE_HEAD_FIGHT_INFO, _role, _bloodPercent);
			}
		}
		//---------------------------------------------


		//---------------------------------------------
		//---------------------------------------------名字
		/**
		 * 添加名字条且更新数据
		 */
		private function addAndUpdateName() : void
		{
			if (_nameBar == null)
			{
				//原来没有添加一个
				_nameBar = HeadNameBar.create();
				this.addChild(_nameBar); //更新一下容器，从临时的到模型真正容器
			}
			var nameColor : uint = HeadBloodUtil.getRoleNameColor(_role);
			
			//更新一下数据
			_nameBar.setName(HeadBloodUtil.getRoleName(_role));
			_nameBar.setColor(nameColor);
			
			//			if (_role.type == SceneCharType.PLAYER)
			//			{
			//				if (!_countryNameBar)
			//				{
			//					_countryNameBar = HeadNameBar.create();
			//					this.addChild(_countryNameBar);
			//				}
			//				var heroData : HeroData = _role.data as HeroData;
			//				var country : String = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_15, "【" + CountryNameCfgData.getCountryFirstChar(heroData.countryId) + "】");
			//				_countryNameBar.setName(country);
			//			}
		}
		
		/**更新官职*/
		public function addAndUpdateOfficeName() : void
		{
			if (_role.type != SceneCharType.PLAYER)
				return;
			
//			var officePos : int = (_role.data as HeroData).countryPos;
//			if (officePos >= 0)
//			{
//				if (_office)
//				{
//					_office.removeFromParent();
//					_office = null;
//				}
//				_office = new InterObject3D();
//				
//				var rud : RenderParamData3D = new RenderParamData3D(RenderUnitID.OFFICE, RenderUnitType.OFFICE, ClientConfig.getOfficeEffect(officePos));
//				_office.addRenderUnitWith(rud, 0);
//				_office.touchable = false;
//				_office.touchAcross = true;
//				this.addChild(_office);
//				_office.start();
//			}
//			else
//			{
//				if (_office)
//				{
//					_office.removeFromParent();
//					_office.dispose();
//					_office = null;
//				}
//			}
			updateAllBarPosition();
		}

		//---------------------------------------------帮派
		/**
		 * 添加帮派条且更新数据
		 */
		public function addAndUpdateGuildName() : void
		{
			if (_role.type != SceneCharType.PLAYER)
				return;
			
			if (_role.isMainChar)
				return;
			
			var guildName : String = (_role.data as HeroData).guildName;
			if (guildName == "" || guildName == null)
			{
				if (_guildNameBar != null)
				{
					HeadNameBar.recycle(_guildNameBar);
					_guildNameBar = null;
					
					updateAllBarPosition();
				}
				return;
			}
			
			if (_guildNameBar == null)
			{
				//原来没有添加一个
				_guildNameBar = HeadNameBar.create();
				this.addChild(_guildNameBar); //更新一下容器，从临时的到模型真正容器
//				if((_role.data as HeroData).isKingFamily)
//				{
//					_guildNameBar.setName("[王城]"+guildName);
//				}
//				else
//				{
//					_guildNameBar.setName(guildName);
//				}
				_guildNameBar.setColor(StaticValue.COLOR_CODE_1);
				updateAllBarPosition();
				return;
			}
			
			//更新一下数据
//			if((_role.data as HeroData).isKingFamily)
//			{
//				_guildNameBar.setName("[王城]"+guildName);
//			}
//			else
//			{
//				_guildNameBar.setName(guildName);
//			}
			updateAllBarPosition();
		}
		
		//---------------------------------------------家族
		/**
		 * 添加家族名字条且更新数据
		 */
		public function addAndUpdateFamilyName() : void
		{
			if (_role.type != SceneCharType.PLAYER)
				return;
			
			if (_role.isMainChar)
				return;
			
			var familyName : String = (_role.data as HeroData).societyName;
			if (familyName == "" || familyName == null)
			{
				if (_familNameBar != null)
				{
					HeadNameBar.recycle(_familNameBar);
					_familNameBar = null;
					
					updateAllBarPosition();
				}
				return;
			}
			
			if (_familNameBar == null)
			{
				//原来没有添加一个
				_familNameBar = HeadNameBar.create();
				this.addChild(_familNameBar); //更新一下容器，从临时的到模型真正容器
				_familNameBar.setName(familyName);
				_familNameBar.setColor(StaticValue.COLOR_CODE_1);
				updateAllBarPosition();
				return;
			}
			
			//更新一下数据
			_familNameBar.setName(familyName);
			updateAllBarPosition();
		}
		
		//---------------------------------------------国战图标
		/**
		 * 添加任务图标,可用于角色任务状态
		 *
		 */
		public function addCountryWarIco(styleName : String) : void
		{
			if (_countryWarIcon == null)
			{
				_countryWarIcon = new UIAsset();
			}
			_countryWarIcon.onImageLoaded = updatePosCallback;
			_countryWarIcon.styleName = styleName;
			_countryWarIcon.setTexture(GuiTheme.ins.getTexture(styleName));
			_countryWarIcon.touchable = _countryWarIcon.touchGroup = false;
			_countryWarIcon.touchAcross = true;
			//			container.addChild(_countryWarIcon);
			//			_countryWarIcon.setRequiresRedraw();
		}
		
		public function addBiaoFlagIcon(styleName : String) : void
		{
			if (_biaoFlagIcon == null)
			{
				_biaoFlagIcon = new UIAsset();
			}
			_biaoFlagIcon.onImageLoaded = updatePosCallback;
			_biaoFlagIcon.styleName = styleName;
			_biaoFlagIcon.setTexture(GuiTheme.ins.getTexture(styleName));
			_biaoFlagIcon.touchable = _biaoFlagIcon.touchGroup = false;
			_biaoFlagIcon.touchAcross = true;
		}
		
		private function updatePosCallback(asset : UIAsset) : void
		{
			updateAllBarPosition();
		}
		
		/**
		 * 删除任务图标
		 *
		 */
		public function removeCountryWarIco() : void
		{
			if (_countryWarIcon == null)
				return;
			
			_countryWarIcon.removeFromParent();
			_countryWarIcon.dispose();
			_countryWarIcon = null;
		}
		
		public function removeBiaoFlagIcon() : void
		{
			if (_biaoFlagIcon == null)
				return;
			
			_biaoFlagIcon.removeFromParent();
			_biaoFlagIcon.dispose();
			_biaoFlagIcon = null;
		}
		
		//---------------------------------------------国战图标
		/**
		 * 添加任务图标,可用于角色任务状态
		 *
		 */
		public function addFamilyWarIco(styleName : String) : void
		{
			if (_familyWarIcon == null)
			{
				_familyWarIcon = new UIAsset();
			}
			_familyWarIcon.onImageLoaded = updateFamilyWarIconPos;
			_familyWarIcon.styleName = styleName;
			_familyWarIcon.setTexture(GuiTheme.ins.getTexture(styleName));
			_familyWarIcon.touchable = _familyWarIcon.touchGroup = false;
			_familyWarIcon.touchAcross = true;
			//			container.addChild(_familyWarIcon);
			//			_familyWarIcon.setRequiresRedraw();
		}
		
		private function updateFamilyWarIconPos(asset : UIAsset) : void
		{
			updateAllBarPosition();
		}
		
		/**
		 * 删除任务图标
		 *
		 */
		public function removeFamilyWarIco() : void
		{
			if (_familyWarIcon == null)
				return;
			
			_familyWarIcon.removeFromParent();
			_familyWarIcon.dispose();
			_familyWarIcon = null;
		}

		//---------------------------------------------
		//---------------------------------------------任务图标
		/**
		 * 添加任务图标,可用于角色任务状态
		 *
		 */
		public function addIco(icon : String = null) : void
		{
			if (!icon)
				icon = ClientConfig.getTaskNPCIcon();
			if (_icoImage == null)
			{
				_icoImage = new UIAsset();
				_icoImage.onImageLoaded = updateTaskImagePos;
				_icoImage.styleName = icon;
				_icoImage.touchable = _icoImage.touchGroup = false;
				_icoImage.touchAcross = true;
				this.addChild(_icoImage);
			}
		}

		private function updateTaskImagePos(asset : UIAsset) : void
		{
			updateAllBarPosition();
		}

		/**
		 * 删除任务图标
		 *
		 */
		public function removeIco() : void
		{
			if (_icoImage == null)
				return;

			_icoImage.parent.removeChild(_icoImage);
			_icoImage.dispose();
			_icoImage = null;
		}

		/**
		 * 更新body图标的位置
		 * @param asset
		 *
		 */
		private function updateBodyImagePos(asset : UIAsset) : void
		{
			if (_bodyImage)
			{
				_bodyImage.x = -_bodyImage.width / 2;
				var h : int = _bodyImage.height - 125;
				_bodyImage.y = _nameBar ? _nameBar.y - h : -h;
			}
		}

		override public function instanceDispose() : void
		{
			if (_effectGroup)
			{
				_effectGroup.dispose();
				_effectGroup = null;
			}
			_bloodPercent = 1;
			removeBodyRender();
			removeCountryWarIco();
			removeBiaoFlagIcon();
			removeFamilyWarIco();
			_role = null;
			_isSelected = false;
			_isCamouflage = false;
			super.instanceDispose();
		}
		
		//------------------接口----------------
		
		
		override public function recycleSelf() : void
		{
			super.recycleSelf();
			recycle(this);
		}
		
		public function get effectGroup() : HeadFaceEffectGroup
		{
			return _effectGroup;
		}
		
		public function get isSelected() : Boolean
		{
			return _isSelected;
		}
		
		public function set isSelected(value : Boolean) : void
		{
			if (_isSelected == value)
				return;
			_isSelected = value;
			updateShowAndHide();
		}
		
		/**
		 * 更新角色名字
		 * @param color
		 *
		 */
		override public function updateName() : void
		{
			//更新一下数据
			if (_nameBar != null)
			{
				_nameBar.setName(HeadBloodUtil.getRoleName(_role));
				var nameColor : uint = HeadBloodUtil.getRoleNameColor(_role);
				_nameBar.setColor(nameColor);
				updateAllBarPosition();
			}
		}
		
		/**
		 * 删除图标
		 *
		 */
		public function removeBodyIco() : void
		{
			if (_bodyImage == null)
				return;
			
			_bodyImage.parent.removeChild(_bodyImage);
			_bodyImage.dispose();
			_bodyImage = null;
		}
		
		//------------------------------------------销毁
		override protected function removeBodyRender() : void
		{
			super.removeBodyRender();
			bind(null, null);
			if (_nameBar != null)
			{
				HeadNameBar.recycle(_nameBar);
				_nameBar = null;
			}
			//			if (_countryNameBar != null)
			//			{
			//				HeadNameBar.recycle(_countryNameBar);
			//				_countryNameBar = null;
			//			}
			if (_junXianBar != null)
			{
				HeadNameBar.recycle(_junXianBar);
				_junXianBar = null;
			}
			
			if (_guildNameBar != null)
			{
				HeadNameBar.recycle(_guildNameBar);
				_guildNameBar = null;
			}
			
			if (_familNameBar != null)
			{
				HeadNameBar.recycle(_familNameBar);
				_familNameBar = null;
			}
			
			if (_office != null)
			{
				_office.dispose();
				_office = null;
			}
			
			if (_bloodBar != null)
			{
				HeadBloodBar.recycle(_bloodBar);
				_bloodBar = null;
			}
			if (_moodMC != null)
			{
				_moodMC.dispose();
				_moodMC = null;
			}
			if (_title != null)
			{
				_title.dispose();
				_title = null;
			}
			if (_moodTween != null)
			{
				_moodTween.kill();
				_moodTween = null;
			}
			removeIco();
			removeBodyIco();
			TweenLite.killDelayedCallsTo(hideMoodMC);
		}
		
		override public function showHead() : void
		{
			super.showHead();
			if (_isSelected && _role && _role.type == SceneCharType.PLAYER)
				return;
			showAndHideElement(_nameBar, true);
//			if (_role.type != SceneCharType.MONSTER /*&& _role.type != SceneCharType.SUMMON_MONSTER*/)
//				showAndHideElement(_bloodBar, true);
		}
		
		//---------------------------------------------
		//---------------------------------------------心情动画
		public function addMoodMC(faceInfo : FaceInfo) : void
		{
			if (_role)
			{
				var camouflage : SceneRole = _role.getCamouflageEntity() as SceneRole;
				if (camouflage)
				{
					var camouflageHeadFace : HeadFace = camouflage.headFace as HeadFace;
					if (camouflageHeadFace)
					{
						camouflageHeadFace.addMoodMC(faceInfo);
					}
					return;
				}
			}
			TweenLite.killDelayedCallsTo(hideMoodMC);
			if (_moodMC == null)
			{
				_moodMC = new UIMovieClip();
				_moodMC.frameRate = 6;
				_moodMC.autoPlay = true;
			}
			_moodMC.styleClass = faceInfo.faceClass;
			_moodMC.validate();
			this.addChild(_moodMC);
			_moodMC.play();
			updateAllBarPosition();
			if (_moodTween)
			{
				_moodTween.kill();
				_moodTween = null;
			}
			_moodTween = TweenLite.delayedCall(5, hideMoodMC);
		}
		
		override public function hideHead() : void
		{
			super.hideHead();
			if (_role && _role.type == SceneCharType.PLAYER)
				return;
			if (_isSelected)
				return;
			
			showAndHideElement(_nameBar, false);
			//			showAndHideElement(_countryNameBar, false);
			showAndHideElement(_junXianBar, false);
			showAndHideElement(_countryWarIcon, false);
			showAndHideElement(_biaoFlagIcon, false);
			showAndHideElement(_bloodBar, false);
			showAndHideElement(_icoImage, false);
			showAndHideElement(_guildNameBar, false);
			showAndHideElement(_familNameBar, false);
			showAndHideElement(_office, false);
			showAndHideElement(_bodyImage, false);
		}
		
		/**根据武勋值来显示军衔称号*/
		public function updateJunXian(militaryID : int) : void
		{
//			var cfgData : Military = MilitaryCfgData.getDataByID(militaryID);
//			if (cfgData)
//			{
//				if (!_junXianBar)
//				{
//					_junXianBar = HeadNameBar.create();
//					this.addChild(_junXianBar);
//					_junXianBar.setColor(StaticValue.COLOR_CODE_17);
//				}
//				_junXianBar.setName(cfgData.name);
//				updateAllBarPosition();
//			}
		}
		
		/**
		 * 增加称号或者移除称号显示
		 * @param titleID 如果为0，则取消称号
		 */
		public function updateTitle(titleID : int) : void
		{
//			if (titleID > 0)
//			{
//				if (_title)
//				{
//					_title.removeFromParent();
//					_title = null;
//				}
//				_title = new InterObject3D();
//				
//				var titleData : TitleTreeData = TitleCfgData.titleHM.getValue(titleID);
//				var rud : RenderParamData3D = new RenderParamData3D(RenderUnitID.TITLE, RenderUnitType.TITLE, ClientConfig.getTitleEffect(titleData.effect));
//				_title.addRenderUnitWith(rud, 0);
//				this.addChild(_title);
//				_title.start();
//			}
//			else
//			{
//				if (_title)
//				{
//					_title.removeFromParent();
//					_title = null;
//				}
//			}
			
			updateAllBarPosition();
		}
		
		//---------------------------------------------
		//---------------------------------------------心情动画
		
		private function hideMoodMC() : void
		{
			if (_moodMC)
			{
				_moodMC.removeFromParent();
				_moodMC.dispose();
				_moodMC = null;
			}
			updateAllBarPosition();
		}
		
		public function showBloodBar():void
		{
			this.addChildAt(_bloodBar,0);
			if(showBloodTween){
				showBloodTween.kill();
				showBloodTween=null;
			}
			showBloodTween=TweenLite.delayedCall(2,onHideBlood);
			sortAttackFace();
		}
		
		private function onHideBlood():void
		{
			if(showBloodTween){
				showBloodTween.kill();
				showBloodTween=null;
			}
			showAndHideElement(_bloodBar,false);
		}
	}
}
