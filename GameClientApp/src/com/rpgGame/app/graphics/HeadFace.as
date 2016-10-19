package com.rpgGame.app.graphics
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.main.chat.ChatFramOnRole;
	import com.rpgGame.app.utils.HeadBloodUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.FaceInfo;
	import com.rpgGame.coreData.type.AttachDisplayType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 头部表现
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-10 上午11:12:28
	 *
	 */
	public class HeadFace extends BaseHeadFace implements IPoolClass
	{
		private static var headFacePool : Pool = new Pool("headFacePool", 300);

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
		
		/** 血条*/
		private var _bloodBar : HeadBloodBar;
		private var _bloodPercent : Number = 1;
		private var _guildNameBar : HeadNameBar;
		private var _familNameBar : HeadNameBar;
		/** 图标图片*/
		private var _icoImage : UIAsset;
		/**心情动画*/
		private var _moodMC : UIMovieClip;
		private var _moodTween : TweenLite;
		/**头顶说话*/
		private var _wordFrame : ChatFramOnRole;
		private var _wordTween : TweenLite;
		/** body图标*/
		private var _bodyImage : UIAsset;
		/** 人物头顶特效 **/
		private var _effectGroup : HeadFaceEffectGroup;

		public function HeadFace(role : SceneRole)
		{
			super();
			_bloodPercent = 1;
			reSet([role]);
		}

		public function reSet($parameters : Array) : void
		{
			_role = $parameters[0] as SceneRole;
			_effectGroup = new HeadFaceEffectGroup(_role);
			_isSelected = false;
			_isCamouflage = false;
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
					//addAndUpdateFamilyName();//暂无家族
					break;
				case SceneCharType.NPC:
				case SceneCharType.PROTECT_NPC:
				case SceneCharType.MONSTER:
				case SceneCharType.LIANG_CANG:
				case SceneCharType.COLLECT:
				case SceneCharType.BIAO_CHE:
				case SceneCharType.DROP_GOODS:
				case SceneCharType.MOUNT:
				case SceneCharType.STALL:
				case SceneCharType.ZHAN_CHE:
					addAndUpdateHP();
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
			//不管是临时，还是模型加载完成的，这是不能为NULL
			if (container == null)
				return;

			//更新一下容器，从临时的到模型真正容器
			addElement(_bloodBar);
			addElement(_nameBar);
			addElement(_guildNameBar);
			addElement(_familNameBar);
			addElement(_icoImage);
			addElement(_bodyImage);
			addElement(_moodMC);
		}

		//---------------------------------------------
		override protected function updateShowAndHide() : void
		{
			var nameVisible : Boolean = _role.getAttachVisible(AttachDisplayType.ROLE_HEAD_NAME);
			showAndHideElement(_bloodBar, false);
			if (_role.type == SceneCharType.NPC) //NPC，不管是否被选中都显示
			{
				showAndHideElement(_nameBar, nameVisible);
				showAndHideElement(_icoImage, true);
				return;
			}
			else if (_role.type == SceneCharType.PROTECT_NPC) //保护npc，全显示或者全隐藏
			{
				showAndHideElement(_nameBar, _isSelected && nameVisible);
				showAndHideElement(_bloodBar, _isSelected);
				return;
			}
			else if (_role.type == SceneCharType.MONSTER) //怪物，全显示或者全隐藏
			{
				showAndHideElement(_nameBar, _isSelected && nameVisible);
				return;
			}
			else if (_role.type == SceneCharType.ZHAN_CHE) //战车
			{
				showAndHideElement(_nameBar, true);
				showAndHideElement(_bloodBar, true);
				return;
			}
			else if (_role.type == SceneCharType.LIANG_CANG) //怪物，全显示或者全隐藏
			{
				showAndHideElement(_nameBar, _isSelected && nameVisible);
				return;
			}else if(_role.type == SceneCharType.STALL)//摆摊
			{
				showAndHideElement(_nameBar, nameVisible);
			}
			else if (_role.type == SceneCharType.PLAYER) //玩家
			{
				if (_role.isMainChar) //自己
				{
					//显示血条、称号、昵称
					showAndHideElement(_nameBar, nameVisible && !_isCamouflage);
					showAndHideElement(_guildNameBar, !_isCamouflage);
					showAndHideElement(_familNameBar, !_isCamouflage);
					return;
				}

				showAndHideElement(_bodyImage, !_isCamouflage);
				//名字、称号
				showAndHideElement(_nameBar, nameVisible && !_isCamouflage);

				//选中显示
				//showAndHideElement( _bloodBar, _isSelected );
				showAndHideElement(_guildNameBar, _isSelected && !_isCamouflage);
				showAndHideElement(_familNameBar, _isSelected && !_isCamouflage);
				return;
			}
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
			if (container == null)
				return;

			var startPosy : int = 0; //不是临时的，说明模型那么就按名字绑定点就好了
			if (isTemporary)
			{
				//临时的或都模型没有血条的那么这就是固定值，从脚底再加上这个值的位置
				startPosy = -100;
			}

			var upPosy : int = startPosy;
			var downPosy : int = 0;
			var chatPos : int = startPosy;

			if (_bloodBar != null) //血条位置
			{
				_bloodBar.x = -_bloodBar.realWidth * 0.5;
				_bloodBar.y = upPosy - _bloodBar.realHeight;
				upPosy = _bloodBar.y - _bloodBar.textHeight;
			}

			//玩家名字为标准位置
			if (_nameBar != null) //名字位置
			{
				_nameBar.x = int(-_nameBar.realWidth / 2);
				_nameBar.y = int(upPosy - _nameBar.realHeight);
				upPosy = _nameBar.y;
				chatPos = _nameBar.y;
				downPosy = _nameBar.y + _nameBar.realHeight;
			}
			if (_icoImage) //任务图标
			{
				_icoImage.x = -_icoImage.width / 2;
				_icoImage.y = upPosy - _icoImage.height;
				upPosy = _icoImage.y;
			}
			if (_wordFrame && _wordFrame.parent)
			{
				_wordFrame.x = -_wordFrame.width / 2;
				_wordFrame.y = chatPos - _wordFrame.height;
				chatPos = _wordFrame.y;
			}
			if (_moodMC && _moodMC.parent) //心情动画
			{
				var mcWidth : int = 56;
				var mcHeight : int = 56;
				_moodMC.x = -mcWidth / 2;
				_moodMC.y = chatPos - mcHeight;
				chatPos = _moodMC.y;
			}
			//-------------------------------------
			//玩家名字之下的
			if (_guildNameBar != null && _guildNameBar.text != "")
			{
				_guildNameBar.x = -_guildNameBar.realWidth / 2;
				_guildNameBar.y = downPosy;
				downPosy = _guildNameBar.y + _guildNameBar.realHeight;
			}

			if (_familNameBar != null && _familNameBar.text != "")
			{
				_familNameBar.x = -_familNameBar.realWidth / 2;
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
				container.addChild(_bloodBar); //更新一下容器，从临时的到模型真正容器
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
				container.addChild(_nameBar); //更新一下容器，从临时的到模型真正容器
			}
			var nameColor : uint = HeadBloodUtil.getRoleNameColor(_role);

			//更新一下数据
			_nameBar.update(HeadBloodUtil.getRoleName(_role), nameColor);
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

			var guildName : String = _role.data.hasOwnProperty("guildName") ? _role.data["guildName"] : null;
			if (guildName == "")
			{
				if (_guildNameBar != null)
				{
					if (_guildNameBar != null)
					{
						HeadNameBar.recycle(_guildNameBar);
						_guildNameBar = null;
					}

					updateAllBarPosition();
				}
				return;
			}

			if (_guildNameBar == null)
			{
				//原来没有添加一个
				_guildNameBar = HeadNameBar.create();
				container.addChild(_guildNameBar); //更新一下容器，从临时的到模型真正容器
				_guildNameBar.update(guildName, StaticValue.COLOR_CODE_1);
				updateAllBarPosition();
				return;
			}

			//更新一下数据
			_guildNameBar.update(guildName, StaticValue.COLOR_CODE_1);
		}

		//---------------------------------------------家族
		/**
		 * 添加家族名字条且更新数据
		 */
		/*		public function addAndUpdateFamilyName() : void
				{
					if( _role.type != SceneCharType.PLAYER )
						return;

					if( _role.isMainChar )
						return;

					var familyName:String = _role.data.hasOwnProperty("guildName") ?  _role.data["guildName"] : null;
					if( familyName == "" )
					{
						if (_familNameBar != null)
						{
							if (_familNameBar != null )
							{
								HeadNameBar.recycle(_familNameBar);
								_familNameBar = null;
							}

							updateAllBarPosition();
						}
						return;
					}

					if (_familNameBar == null)
					{
						//原来没有添加一个
						_familNameBar = HeadNameBar.create();
						container.addChild( _familNameBar );//更新一下容器，从临时的到模型真正容器
						_familNameBar.update( familyName, StaticValue.WHITE );
						updateAllBarPosition();
						return;
					}

					//更新一下数据
					_familNameBar.update( familyName, StaticValue.WHITE );
				}*/

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
				container.addChild(_icoImage);
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

		override public function dispose() : void
		{
			if (_effectGroup)
			{
				_effectGroup.dispose();
				_effectGroup = null;
			}
			_bloodPercent = 1;
			removeBodyRender();
			_role = null;
			_isSelected = false;
			_isCamouflage = false;
			super.dispose();
		}
		
		//------------------接口----------------
		
		
		override public function recycleSelf():void
		{
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
		 * 更新角色名字颜色（名字颜色设置完再更新）
		 * @param color
		 *
		 */
		public function updateNameColor() : void
		{
			//更新一下数据
			if (_nameBar != null)
				_nameBar.updateNameColor(HeadBloodUtil.getRoleName(_role));
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
		override public function removeBodyRender() : void
		{
			
			bindTarget = null;
			if (_nameBar != null)
			{
				HeadNameBar.recycle(_nameBar);
				_nameBar = null;
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
			if (_moodTween != null)
			{
				_moodTween.kill();
				_moodTween = null;
			}
			if (_wordFrame)
			{
				_wordFrame.dispose();
				_wordFrame = null;
			}
			if (_wordTween)
			{
				_wordTween.kill();
				_wordTween = null;
			}
			TweenLite.killDelayedCallsTo(hideWordFrame);
			TweenLite.killDelayedCallsTo(hideMoodMC);
		}
		
		override public function show() : void
		{
			if (_isSelected && _role && _role.type == SceneCharType.PLAYER)
				return;
			showAndHideElement(_nameBar, true);
			if(_role.type != SceneCharType.MONSTER)
				showAndHideElement(_bloodBar, true); 
		}
		
		//---------------------------------------------
		//---------------------------------------------心情动画
		public function addMoodMC(faceInfo : FaceInfo) : void
		{
			TweenLite.killDelayedCallsTo(hideMoodMC);
			if (_moodMC == null)
			{
				_moodMC = new UIMovieClip();
				_moodMC.frameRate = 6;
				_moodMC.autoPlay = true;
			}
			_moodMC.styleClass = faceInfo.faceClass;
			_moodMC.validate();
			container.addChild(_moodMC);
			_moodMC.play();
			updateAllBarPosition();
			if (_moodTween)
			{
				_moodTween.kill();
				_moodTween = null;
			}
			_moodTween = TweenLite.delayedCall(5, hideMoodMC);
		}
		
		override public function hide() : void
		{
			if (_role && _role.type == SceneCharType.PLAYER)
				return;
			if (_isSelected)
				return;
			
			showAndHideElement(_nameBar, false);
			showAndHideElement(_bloodBar, false);
			showAndHideElement(_icoImage, false);
			showAndHideElement(_guildNameBar, false);
			showAndHideElement(_familNameBar, false);
			showAndHideElement(_bodyImage, false);
		}
		
		//---------------------------------------------
		//---------------------------------------------心情动画
		public function addWordFrame(message : String, delay : Number = 5000) : void
		{
			TweenLite.killDelayedCallsTo(hideWordFrame);
			if (_wordFrame == null)
			{
				_wordFrame = new ChatFramOnRole();
			}
			_wordFrame.show(message);
			container.addChild(_wordFrame);
			updateAllBarPosition();
			if (_wordTween)
			{
				_wordTween.kill();
				_wordTween = null;
			}
			_wordTween = TweenLite.delayedCall(delay * 0.001, hideWordFrame);
		}
		
		public function hideWordFrame() : void
		{
			if (_wordFrame)
			{
				_wordFrame.removeFromParent();
			}
			updateAllBarPosition();
		}
		
		public function hideMoodMC() : void
		{
			if (_moodMC)
			{
				_moodMC.removeFromParent();
				_moodMC.dispose();
			}
			updateAllBarPosition();
		}
	}
}
