package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.app.graphics.decor.DecorCtrl;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.PKMamager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.utils.HeadBloodUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.cfg.HuBaoData;
	import com.rpgGame.coreData.cfg.JunJieData;
	import com.rpgGame.coreData.cfg.RankDesignationData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	import com.rpgGame.coreData.clientConfig.Q_guild_permission;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_rank_designation;
	import com.rpgGame.coreData.enum.RankListType;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.AttachDisplayType;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.structs.IntKeyValue;
	
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
			headFacePool.recycleObj(headFace);
		}
		
		public static const UPDATE_HEAD_FIGHT_INFO : String = "updateHeadFightInfo";
		/**信息条的宽度**/
		public static const WIDTH : uint = 70;
		
		private var _nameBar : HeadNameBar;
		//		private var _countryNameBar : HeadNameBar;2017年1月4日10:26:07 优化本国玩家不需要显示国家名，并且放到nameBar里面
		/**军衔*/
		private var _junXianBar : HeadNameBar;
		
		/**夫妻称号*/
		private var _fuqititle:HeadNameBar;
		
		/** 血条*/
		private var _bloodBar : HeadBloodBar;
		private var _bloodPercent : Number = 1;
		
		/**官职图标*/
		private var _office : InterObject3D;
		
		private var _guildNameBar : HeadNameBar;
		private var _familNameBar : HeadNameBar;
		private var _guildWarInfoBar:GuildWarInfoBar;
		
		/** 图标图片*/
		private var _icoImage : UIAsset;
		/**心情动画*/
		private var _moodMC : UIMovieClip;
		
		/**称号*/
		private var _title : HeadFaceEffect;
		
		/**护宝称号*/
		private var _huabotitle : InterObject3D;
		
		/**NPC称号*/
		private var _NPCtitle : InterObject3D;
		
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
		private var _teamCaptainFlag:UIAsset;
		private var _towerFlag:UIAsset;
		private var _vipFlag:UIAsset;
		
		private var _meirenTitle:HeadNameBar;
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
			
			initAddBar();
			//			setTemporary();
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
					//addAndUpdateOfficeName();
					//addAndUpdateFamilyName();//暂无家族
					addAndUpdateLV();
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
				case SceneCharType.MOUNT:
				case SceneCharType.STALL:
				case SceneCharType.ZHAN_CHE:
					addAndUpdateHP();
					addAndUpdateName();
					addAndUpdateLV();
					updateNPCTitle();
					break;
				case SceneCharType.DROP_GOODS:
					addAndUpdateName();
					break;
				case SceneCharType.GIRL_PET:
					addAndUpdateName();
					break;
				case SceneCharType.SCULPTURE:
					addAndUpdateName();
					
					break;
				//				case SceneCharType.RACING_HERO:
				//				case SceneCharType.ROBOT:
				//addAndUpdateName();
				break;
			}
		}
		
		/**
		 *是否有矿石 
		 * @return 
		 * 
		 */
		public function hasGuildWarOre():Boolean
		{
			return _guildWarInfoBar;
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
			addElement(_huabotitle);
			addElement(_NPCtitle);
			addElement(_office);
			addElement(_countryWarIcon);
			addElement(_biaoFlagIcon);
			addElement(_familyWarIcon);
			addElement(_moodMC);
			addElement(_rankTitle1);
			addElement(_rankTitle2);
			addElement(_meirenTitle);
		}
		
		//---------------------------------------------
		override protected function updateShowAndHide() : void
		{
			if (!_role) 
			{
				return;
			}
			var nameVisible : Boolean = _role.getAttachVisible(AttachDisplayType.ROLE_HEAD_NAME);
			if (_role.type==SceneCharType.GIRL_PET) 
			{
				showAndHideElement(_nameBar, true,DecorCtrl.TOP_NAME);
			}
			if (_role.type == SceneCharType.NPC) //NPC，不管是否被选中都显示
			{
				showAndHideElement(_nameBar, nameVisible,DecorCtrl.TOP_NAME);
				showAndHideElement(_icoImage, true);
				showAndHideElement(_NPCtitle, true,DecorCtrl.TOP_NPCCHENGHAO);
			}
			else if (_role.type == SceneCharType.PROTECT_NPC) //保护npc，全显示或者全隐藏
			{
				showAndHideElement(_nameBar, _isSelected && nameVisible,DecorCtrl.TOP_NAME);
				showAndHideElement(_bloodBar, _isSelected,DecorCtrl.TOP_HPMP);
			}
			else if (_role.type == SceneCharType.MONSTER) //怪物，全显示或者全隐藏
			{
				var monster:Q_monster=MonsterDataManager.getData((_role.data as MonsterData).modelID);
				var isNormal:Boolean=monster.q_monster_type==MonsterType.NORMAL;
				var isNPC:Boolean=monster.q_monster_type==MonsterType.NPC;
				//普通怪在战斗状态显示血条
				//我的召唤怪要显示
				var isMyMonster:Boolean=PKMamager.isMyMonster(_role);
				var isNpc:Boolean=monster.q_monster_type==MonsterType.NPC;
				showAndHideElement(_bloodBar, isMyMonster,DecorCtrl.TOP_HPMP);
				
				showAndHideElement(_nameBar, isMyMonster||(isNormal&&_isSelected && nameVisible)||isNPC,DecorCtrl.TOP_NAME);
				showAndHideElement(_NPCtitle,isNPC, DecorCtrl.TOP_NPCCHENGHAO);
			}
			else if (_role.type == SceneCharType.COLLECT) //采集物显示名称
			{
				showAndHideElement(_nameBar, true,DecorCtrl.TOP_NAME);
			}
			else if (_role.type == SceneCharType.DROP_GOODS) //掉落物，全显示或者全隐藏
			{
				/*	var monster:Q_monster=MonsterDataManager.getData((_role.data as MonsterData).modelID);
				//普通怪在战斗状态显示血条
				if(monster.q_monster_type==MonsterType.NORMAL&&(_isSelected||(_role.stateMachine&&(_role.stateMachine.isAttacking||_role.stateMachine.isHiting)))){
				showAndHideElement(_bloodBar, true);
				}*/
				
				showAndHideElement(_nameBar, _isSelected && nameVisible,DecorCtrl.TOP_NAME);
			}
			else if (_role.type == SceneCharType.GIRL_PET) //美人
			{
				showAndHideElement(_meirenTitle, true,DecorCtrl.TOP_MEIREN_GUISHU);
			}
				//			else if (_role.type == SceneCharType.SUMMON_MONSTER) //召唤怪物，全显示或者全隐藏
				//			{
				//				showAndHideElement(_nameBar, nameVisible);
				//				return;
				//			}
			else if (_role.type == SceneCharType.ZHAN_CHE) //战车
			{
				showAndHideElement(_nameBar, true,DecorCtrl.TOP_NAME);
				showAndHideElement(_bloodBar, true,DecorCtrl.TOP_HPMP);
			}
				//			else if (_role.type == SceneCharType.ROBOT) //机器人
				//			{
				//				showAndHideElement(_nameBar, true);
				//			}
			else if (_role.type == SceneCharType.LIANG_CANG) //怪物，全显示或者全隐藏
			{
				showAndHideElement(_nameBar, _isSelected && nameVisible,DecorCtrl.TOP_NAME);
				return;
			}
			else if (_role.type == SceneCharType.STALL) //摆摊
			{
				showAndHideElement(_nameBar, nameVisible,DecorCtrl.TOP_NAME);
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
				//神秘人buff只显示名字和血条
				var isMysteryMan:Boolean=false;
				if (_role.isMainChar) //自己
				{
					//显示血条、称号、昵称
					showAndHideElement(_nameBar, nameVisible && !_isCamouflage,DecorCtrl.TOP_NAME);
					showAndHideElement(_guildNameBar, !_isCamouflage,DecorCtrl.TOP_GUILD);
					showAndHideElement(_familNameBar, !_isCamouflage);
					showAndHideElement(_bloodBar, true,DecorCtrl.TOP_HPMP);
					isMysteryMan=false;
				}
				else
				{
					isMysteryMan=_role.stateMachine.isMysteryMan;
					showAndHideElement(_bodyImage, !_isCamouflage);
					//名字、称号
					showAndHideElement(_nameBar, nameVisible && !_isCamouflage,DecorCtrl.TOP_NAME);
					//选中显示
					//showAndHideElement( _bloodBar, _isSelected );
					showAndHideElement(_bloodBar, true,DecorCtrl.TOP_HPMP);
					showAndHideElement(_guildNameBar, true,DecorCtrl.TOP_GUILD);
					showAndHideElement(_familNameBar, !isMysteryMan&&_isSelected && !_isCamouflage);
				}
				
				showAndHideElement(_title, !isMysteryMan&&!_isCamouflage,DecorCtrl.TOP_CHENGHAO);
				showAndHideElement(_rankTitle1, !isMysteryMan&&!_isCamouflage,DecorCtrl.TOP_CHENGHAO);
				showAndHideElement(_rankTitle2, !isMysteryMan&&!_isCamouflage,DecorCtrl.TOP_CHENGHAO);
				showAndHideElement(_office, !isMysteryMan&&!_isCamouflage);
				showAndHideElement(_huabotitle, !isMysteryMan&&_nameBar && _nameBar.parent && _nameBar.visible,DecorCtrl.TOP_HUBAOCHENGHAO);
				updateTeamFlag(!isMysteryMan&&Mgr.teamMgr.isMyCaptian(HeroData(_role.data).serverID));
				if(_guildWarInfoBar){
					showAndHideElement(_guildWarInfoBar,true,DecorCtrl.TOP_TOWER);//帮会战信息条
				}
			}
			showAndHideElement(_junXianBar, !isMysteryMan&&_nameBar && _nameBar.parent && _nameBar.visible);
			//			showAndHideElement(_countryNameBar, _nameBar && _nameBar.parent && _nameBar.visible);
			showAndHideElement(_biaoFlagIcon, !isMysteryMan&&_nameBar && _nameBar.parent && _nameBar.visible);
			showAndHideElement(_countryWarIcon,!isMysteryMan&& _nameBar && _nameBar.parent && _nameBar.visible);
			showAndHideElement(_familyWarIcon,!isMysteryMan&& _nameBar && _nameBar.parent && _nameBar.visible);
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
			updateShowAndHide();
			return;
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
			if (_title != null)
			{
				_title.x = -3;
				_title.y = offsetY - 30;
				offsetY = _title.y;
			}
			
			if(_huabotitle != null)
			{
				_huabotitle.x = -3;
				_huabotitle.y = offsetY - 30;
				offsetY = _huabotitle.y;
			}
			
			if(_NPCtitle != null)
			{
				_NPCtitle.x = 0;
				_NPCtitle.y = offsetY - 45;
				offsetY = _NPCtitle.y;
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
			//Render3DTextUtil.addHeadFlowerTextToTarget(_role);
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
			if (_role) 
			{
				_bloodPercent=1;
				var stat:SpriteStat=_role.data.totalStat;
				if (stat) 
				{
					_bloodPercent=stat.hp/stat.life;
				}
			}
			//更新一下数据
			_bloodBar.update(_bloodPercent);
		}
		/**
		 * 添加且更新血条
		 */
		private function addAndUpdateLV() : void
		{
			if (_role.type != SceneCharType.PLAYER&&_role.type!=SceneCharType.MONSTER)
				return;
			
			if (_bloodBar == null)
			{
				//原来没有血条添加一个
				_bloodBar = HeadBloodBar.create(_role);
				//				_bloodBar.state = HeadBloodUtil.getRoleBloodState( _role );
				//				this.addChild(_bloodBar); //更新一下容器，从临时的到模型真正容器
			}
			//更新一下数据
			if (_role.type==SceneCharType.PLAYER) 
			{
				_bloodBar.updateLevel((_role.data as HeroData).totalStat.level);
			}
			else
			{
				_bloodBar.updateLevel((_role.data as MonsterData).monsterData.q_level);
			}
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
			if (_bloodBar&&_bloodBar.stage)
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
		public function showBloodStr(str:String):void
		{
			if (_bloodBar) 
			{
				_bloodBar.showBloodText(str);
			}
		}
		public function set level(value : int) : void
		{
			
			if (_bloodBar)
			{
				_bloodBar.updateLevel(value);
			}
		}
		public function checkBloodState() : void
		{
			
			if (_bloodBar)
			{
				_bloodBar.checkState();
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
				//this.addChild(_nameBar); //更新一下容器，从临时的到模型真正容器
				//this.deCtrl.addTop(_nameBar,DecorCtrl.TOP_NAME);
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
			var guildMemberType: int = (_role.data as HeroData).guildMemberType;
			var guildName : String = (_role.data as HeroData).guildName;
			if (guildMemberType<=0||guildName == "" || guildName == null)
			{
				if (_guildNameBar != null)
				{
					deCtrl.removeTop(_guildNameBar);
					HeadNameBar.recycle(_guildNameBar);
					_guildNameBar = null;
					updateAllBarPosition();
				}
				return;
			}
			
			var q_guild:Q_guild_permission = GuildCfgData.getPermissionInfo(guildMemberType);
			guildName += "."+q_guild.q_name;
			if (_guildNameBar == null)
			{
				//原来没有添加一个
				_guildNameBar = HeadNameBar.create();
				//				this.addChild(_guildNameBar); //更新一下容器，从临时的到模型真正容器
				_guildNameBar.setName(guildName);
				_guildNameBar.setColor(StaticValue.COLOR_CODE_15);
				updateAllBarPosition();
				return;
			}
			
			//更新一下数据
			_guildNameBar.setName(guildName);
			updateAllBarPosition();
		}
		
		/**美人归属*/
		public function addAndUpdateGuiShu():void
		{
			if(_role.type==SceneCharType.GIRL_PET)
			{
				var guishu:String=(_role.data as GirlPetData).ownerName+"的美人";
				if(_meirenTitle==null)
				{
					_meirenTitle = HeadNameBar.create();
				}
				_meirenTitle.setName(guishu);
				_meirenTitle.setColor(StaticValue.A_UI_GREEN_TEXT);
				updateAllBarPosition();
			}
				
			else
			{
				if(_meirenTitle!=null)
				{
					deCtrl.removeTop(_meirenTitle);
					HeadNameBar.recycle(_meirenTitle);
					_meirenTitle = null;
					updateAllBarPosition();
				}
			}
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
		
		override public function putInPool() : void
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
			super.putInPool();
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
		public function setName(name:String):void
		{
			if (_nameBar != null)
			{
				_nameBar.setName(name);
				var nameColor : uint = HeadBloodUtil.getRoleNameColor(_role);
				_nameBar.setColor(nameColor);
				updateAllBarPosition();
				deCtrl.sortTop();
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
			if (showBloodTween) 
			{
				showBloodTween.kill();
				showBloodTween=null;
			}
			if (_nameBar != null)
			{
				deCtrl.removeTop(_nameBar);
				HeadNameBar.recycle(_nameBar);
				_nameBar = null;
			}
			//			if (_countryNameBar != null)
			//			{
			//				HeadNameBar.recycle(_countryNameBar);
			//				_countryNameBar = null;
			//			}
			if (_fuqititle != null)
			{
				deCtrl.removeTop(_fuqititle);
				HeadNameBar.recycle(_fuqititle);
				_fuqititle = null;
			}
			
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
				deCtrl.removeTop(_bloodBar);
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
			
			if (_rankTitle1 != null)
			{
				_rankTitle1.dispose();
				_rankTitle1 = null;
			}
			
			if (_rankTitle2 != null)
			{
				_rankTitle2.dispose();
				_rankTitle2 = null;
			}
			if(_huabotitle != null)
			{
				_huabotitle.dispose();
				_huabotitle =  null;
			}
			if(_NPCtitle != null)
			{
				_NPCtitle.dispose();
				_NPCtitle=null;
			}
			if (_moodTween != null)
			{
				_moodTween.kill();
				_moodTween = null;
			}
			removeIco();
			removeBodyIco();
			TweenLite.killDelayedCallsTo(hideMoodMC);
			updateTeamFlag(false);
			updateTowerFlag(false);
			setVipFlag(0);
		}
		
		
		override public function showHead() : void
		{
			super.showHead();
			if (_isSelected && _role && _role.type == SceneCharType.PLAYER)
				return;
			showAndHideElement(_nameBar, true,DecorCtrl.TOP_NAME);
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
			
			showAndHideElement(_nameBar, false,DecorCtrl.TOP_NAME);
			showAndHideElement(_fuqititle, false,DecorCtrl.TOP_FUQI);
			//			showAndHideElement(_countryNameBar, false);
			showAndHideElement(_junXianBar, false);
			showAndHideElement(_countryWarIcon, false);
			showAndHideElement(_biaoFlagIcon, false);
			onHideBlood();
			//showAndHideElement(_bloodBar, false);
			showAndHideElement(_icoImage, false);
			showAndHideElement(_guildNameBar, false,DecorCtrl.TOP_GUILD);
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
			if (titleID > 0)
			{
				if (_title)
				{
					this.deCtrl.removeTop(_title)
					_title.dispose();
					_title = null;
				}
				_title = new HeadFaceEffect();
				//				var titleData : TitleTreeData = TitleCfgData.titleHM.getValue(titleID);
				var effName:String=JunJieData.getEffById(titleID);
				_title.playEffect(170,65,ClientConfig.getEffect(effName),0,65,0);
				//var rud:RenderParamData3D = new RenderParamData3D(RenderUnitID.JUNJIE, RenderUnitType.JUNJIE, ClientConfig.getEffect(effName));
				//_title.addRenderUnitWith(rud, 0);
				//				this.addChild(_title);
				this.deCtrl.addTop(_title,DecorCtrl.TOP_CHENGHAO);
				//_title.start();
			} 
			else
			{
				if (_title)
				{
					this.deCtrl.removeTop(_title);
					_title.dispose();
					//_title.removeFromParent();
					_title = null;
				}
			}
			
			updateAllBarPosition();
		}
		
		/**
		 * 增加夫妻称号
		 */
		public function updateFuQiTitle(otherName:String) : void
		{
			if (!_role||SceneCharType.PLAYER!=_role.type) 
			{
				return;
			}
			if (otherName!=null&&otherName!="") 
			{
				if (!_fuqititle) 
				{
					_fuqititle=HeadNameBar.create();
				}
				
				var fuqiName:String=otherName+"的"+((_role.data as HeroData).sex==1?"老公":"老婆");
				_fuqititle.setName(fuqiName);
				_fuqititle.setColor(StaticValue.A_UI_BEIGE_TEXT);
				deCtrl.addTop(_fuqititle,DecorCtrl.TOP_FUQI);
			}
			else
			{
				if (_fuqititle) 
				{
					deCtrl.removeTop(_fuqititle);
					HeadNameBar.recycle(_fuqititle);
					_fuqititle=null;
				}
			}
		}
		
		/**
		 *创建帮派战信息条 
		 * 
		 */
		private function createGuildWarBar():void
		{
			var mapId:int=MainRoleManager.actorInfo.mapID;
			var sceneData:SceneData=MapDataManager.getMapInfo(mapId);
			var mapCfg:Q_map=sceneData.getData();
			if(GuildManager.instance().haveGuild==false||mapCfg.q_map_type!=EnumMapType.MAP_TYPE_WCZB){//没有帮会或者不是帮会战地图
				if(_guildWarInfoBar){
					_guildWarInfoBar.removeFromParent();
					_guildWarInfoBar=null;
				}
				return;
			}
			if(!_guildWarInfoBar){
				_guildWarInfoBar=GuildWarInfoBar.create(_role);
			}
		}
		
		/**
		 *更新帮会战信息条 
		 * @param oreList
		 * 
		 */
		public function updateGuildWarInfoBar(oreList:Vector.<IntKeyValue>):void
		{
			if(!oreList||oreList.length==0){
				if(_guildWarInfoBar){
					_guildWarInfoBar.removeFromParent();
					_guildWarInfoBar=null;
				}
			}else{
				createGuildWarBar();
			}
			if(_guildWarInfoBar){
				_guildWarInfoBar.update(oreList);
			}
			updateShowAndHide();
		}
		
		/**增加护宝称号货移除称号*/
		public function updateHuBaoTitle(titleID : int) : void
		{
			if (titleID > 0)
			{
				if (_huabotitle)
				{
					_huabotitle.removeFromParent();
					_huabotitle = null;
				}
				_huabotitle = new InterObject3D();
				
				//				var titleData : TitleTreeData = TitleCfgData.titleHM.getValue(titleID);
				var effName:String=HuBaoData.getEffByLv(titleID);
				var rud : RenderParamData3D = new RenderParamData3D(RenderUnitID.BAOWU, RenderUnitType.BAOWU, ClientConfig.getEffect(effName));
				_huabotitle.addRenderUnitWith(rud, 0);
				//				this.addChild(_huabotitle);
				this.deCtrl.addTop(_huabotitle,DecorCtrl.TOP_HUBAOCHENGHAO);
				_huabotitle.start();
			}
			else
			{
				if (_huabotitle)
				{
					_huabotitle.removeFromParent();
					_huabotitle = null;
				}
			}
			
			updateAllBarPosition();
		}
		
		/**增加NPC称号*/
		public function updateNPCTitle() : void
		{
			if(_role.type==SceneCharType.MONSTER)
			{
				if (_NPCtitle)
				{
					_NPCtitle.removeFromParent();
					_NPCtitle = null;
				}
				_NPCtitle = new InterObject3D();
				var effName:String=(_role.data as MonsterData).monsterData.q_chenhao;
				if(effName!=null&&effName!="")
				{
					var rud : RenderParamData3D = new RenderParamData3D(RenderUnitID.BAOWU, RenderUnitType.BAOWU, ClientConfig.getEffect(effName));
					_NPCtitle.addRenderUnitWith(rud, 0);
					//					this.addChild(_NPCtitle);
					this.deCtrl.addTop(_NPCtitle,DecorCtrl.TOP_NPCCHENGHAO);
					_NPCtitle.start();
				}
				updateAllBarPosition();
			}
		}
		
		private static var RankTypeOriderList:Vector.<int>;
		private var _lastType:int;
		private var _rankTitle1:InterObject3D;
		private var _rankTitle2:InterObject3D;
		/** 排行榜称号 */
		public function addAndUpdataRankTitle(list:Vector.<int>):void
		{
			if(list==null)
				return ;
			if(RankTypeOriderList==null)
			{
				RankTypeOriderList = new Vector.<int>();
				RankTypeOriderList.push(RankListType.All_COMBATPOWER_TYPE);
				RankTypeOriderList.push(RankListType.All_MOUNT_TYPE);
				RankTypeOriderList.push(RankListType.All_WARFLAG_TYPE);
				RankTypeOriderList.push(RankListType.All_BEAUTY_TYPE);
				RankTypeOriderList.push(RankListType.COMBATPOWER_TYPE);
			}
			
			var type:int = 0;
			var length:int = RankTypeOriderList.length;
			for(var i:int = 0;i<length;i++)
			{
				if(list.indexOf(RankTypeOriderList[i])>=0)
				{
					type = RankTypeOriderList[i];
					break;
				}
			}
			//			type = 3;
			var q_info:Q_rank_designation;
			var rud:RenderParamData3D;
			var scale:int;
			//其它称号
			if (type > 0)
			{
				if(type != _lastType)
				{
					if (_rankTitle1)
					{
						_rankTitle1.removeFromParent();
						_rankTitle1 = null;
					}
					_rankTitle1 = new InterObject3D();
					q_info= RankDesignationData.getinfoById(type);
					if(_role.type == SceneCharType.SCULPTURE)
					{
						scale = q_info.q_modle_scale;
					}else{
						scale = q_info.q_hero_scale;
					}
					rud = new RenderParamData3D(RenderUnitID.RANKTITLE, RenderUnitType.RANKTITLE, ClientConfig.getEffect(q_info.q_effects));
					_rankTitle1.addRenderUnitWith(rud, 0);
					_rankTitle1.scale = scale/100;
					this.deCtrl.addTop(_rankTitle1,DecorCtrl.TOP_RANKDESIGNATION);
					_rankTitle1.start();
					_lastType = type;
				}
			}else{
				if (_rankTitle1)
				{
					_rankTitle1.removeFromParent();
					_rankTitle1 = null;
				}
			}
			type =  RankListType.ALL_DIANFENG_TYPE;
			if(list.indexOf(type)<0)
			{
				type = 0;
			}
			//			type = 8;
			if (type > 0)
			{
				if (_rankTitle2 == null)
				{
					_rankTitle2 = new InterObject3D();
					q_info= RankDesignationData.getinfoById(type);
					if(_role.type == SceneCharType.SCULPTURE)
					{
						scale = q_info.q_modle_scale;
					}else{
						scale = q_info.q_hero_scale;
					}
					rud = new RenderParamData3D(RenderUnitID.RANKTITLE, RenderUnitType.RANKTITLE, ClientConfig.getEffect(q_info.q_effects));
					_rankTitle2.addRenderUnitWith(rud, 0);
					_rankTitle2.scale = scale/100;
					this.deCtrl.addTop(_rankTitle2,DecorCtrl.TOP_RANKDESIGNATION1);
					_rankTitle2.start();
				}
				
			}else{
				if (_rankTitle2)
				{
					_rankTitle2.removeFromParent();
					_rankTitle2 = null;
				}
			}
			
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
			//精英或者boss不显示小学条
			if (_role.type == SceneCharType.MONSTER) 
			{
				if ((_role.data as MonsterData).monsterData.q_monster_type!=MonsterType.NORMAL) 
				{
					if (!PKMamager.isMyMonster(_role)) 
					{
						return;
					}
					
				}
				this.deCtrl.addTop(_nameBar,DecorCtrl.TOP_NAME);
			}
			//this.addChildAt(_bloodBar,0);
			this.deCtrl.addTop(_bloodBar,DecorCtrl.TOP_HPMP);
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
			//showAndHideElement(_bloodBar,false,DecorCtrl.TOP_HPMP);
			updateShowAndHide();
		}
		
		public function updateTeamFlag(bShow:Boolean):void
		{
			if (bShow) 
			{
				if (!_teamCaptainFlag) 
				{
					_teamCaptainFlag=new UIAsset();
					_teamCaptainFlag.styleName="ui/mainui/head/duiyou.png";
					_teamCaptainFlag.x=-22;
					_teamCaptainFlag.y=6;
				}
				if (_bloodBar) 
				{
					_bloodBar.addChild(_teamCaptainFlag);
					//deCtrl.sortTop();
				}
			}
			else 
			{
				if (_teamCaptainFlag&&_teamCaptainFlag.parent) 
				{
					MCUtil.removeSelf(_teamCaptainFlag);
					//	deCtrl.sortTop();
				}
			}
		}
		public function updateTowerFlag(bShow:Boolean):void
		{
			if (bShow) 
			{
				if (!_towerFlag) 
				{
					_towerFlag=new UIAsset();
					_towerFlag.styleName="ui/mainui/fubenzhuizong/tower/qiangzhanqi.png";
				}
				deCtrl.addTop(_towerFlag,DecorCtrl.TOP_TOWER);
			}
			else 
			{
				if (_towerFlag) 
				{
					deCtrl.removeTop(_towerFlag);
					_towerFlag.dispose();
					_towerFlag=null;
				}
			}
		}
		public function updateMysteryMan():void
		{
			updateShowAndHide();
		}
		public function setVipFlag(vipLv:int):void
		{
			if (vipLv!=0) 
			{
				if (!_vipFlag) 
				{
					_vipFlag=new UIAsset();
					
				}
				_vipFlag.styleName="ui/common/tubiao/vipb"+vipLv+".png";
				_vipFlag.x=-46;
				_vipFlag.y=(_nameBar.height-29)*0.5;
				_nameBar.addChild(_vipFlag);
				deCtrl.sortTop();
			}
			else
			{
				if (_vipFlag) 
				{
					MCUtil.removeSelf(_vipFlag);
					_vipFlag.dispose();
					_vipFlag=null;
					deCtrl.sortTop();
				}
			}
		}
		public function sort():void
		{
			deCtrl.sortTop();
		}
		override public function get height():Number
		{
			return deCtrl.topHeight;
		}
	}
}
