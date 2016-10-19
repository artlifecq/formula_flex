package game.rpgGame.login.view
{
	import com.game.engine3D.scene.display.PixelHitArea;
	import com.game.engine3D.utils.DisplayUtil;
	import com.gameClient.utils.StringFilter;

	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;

	import feathers.controls.Radio;
	import feathers.controls.UIAsset;
	import feathers.themes.GuiTheme;
	import feathers.themes.ThemeLoader;
	import feathers.utils.filter.GrayFilter;

	import game.rpgGame.login.util.RandomNick;

	import org.mokylin.skin.loginui.CreateHeroSkin;
	import org.mokylin.skin.loginui.HeroBtnListSkin;
	import org.mokylin.skin.loginui.HeroFaceListSkin;
	import org.mokylin.skin.loginui.HeroListSkin;
	import org.mokylin.skin.loginui.HeroNameInputSkin;
	import org.mokylin.skin.loginui.HeroStepTitleSkin;

	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	import utils.UIStateSetHelper;

	/**
	 *
	 * 创建英雄面板
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-31 上午11:53:32
	 *
	 */
	public class CreateHeroPanel extends Sprite
	{
		private static const STEP_SELECT_HERO : int = 1;
		private static const STEP_NAME_INPUT : int = 2;
		//private static const STEP_SELECT_FACE : int = 2000;

		private static const CHAR_a : Number = "a".charCodeAt(0);
		private static const CHAR_z : Number = "z".charCodeAt(0);
		private static const CHAR_A : Number = "A".charCodeAt(0);
		private static const CHAR_Z : Number = "Z".charCodeAt(0);
		private static const CHAR_0 : Number = "0".charCodeAt(0);
		private static const CHAR_9 : Number = "9".charCodeAt(0);
		/**命名字符长度**/
		private const MIN_CHARS : uint = 3;
		private const MAX_CHARS : uint = 14;

		private var _themeLoader : ThemeLoader;
		private var _localPoint : Point = new Point();
		private var _globalPoint : Point = new Point();

		private var _previousChar : String = "";
		private var _nickName : String;

		private var _createHeroSkin : CreateHeroSkin;
		private var _heroListSkin : HeroListSkin;
		private var _heroBtnListSkin : HeroBtnListSkin;
		private var _heroNameInputSkin : HeroNameInputSkin;
		private var _heroStepTitleSkin : HeroStepTitleSkin;
		private var _heroFaceListSkin : HeroFaceListSkin;
		private var _stage : Stage;

		private var _fanWholeStartX : int = 1100;
		private var _fanWholeStartY : int = 400;
		private var _fanWholeEndX : int = 650;
		private var _fanWholeEndY : int = 430;
		private var _jueseScale : Number = 0.85;
		private var _bgDarkShapeAlpha : Number = 0.4;

		private var _heroListContainer : Sprite;
		private var _heroNameContainer : Sprite;
		private var _stepTitleContainer : Sprite;
		private var _heroBtnListContainer : Sprite;
		private var _heroFaceListContainer : Sprite;

		private var _countryRadios : Array;
		private var _countryJianTxts : Array;
		private var _faceRadios : Array;
		private var _manFaces : Array;
		private var _womanFaces : Array;
		private var _step : int = 0;

		private var _avatarOffX : int = 635;
		private var _avatarOffY : int = 500;
		private var _onCreateCharFunc : Function;
		private var _onShowInfoAlertFunc : Function;

		private var _selectedRoleIndex : int = 0;

		/** 选择的国家 **/
		private var _country : int = 1;
		/** 选择的头像 **/
		private var _face : int = 1;
		/** 选择的身体 **/
		private var _body : int = 0;
		/** 选择的性别 **/
		private var _sex : int = 0;

		public function CreateHeroPanel(parent : DisplayObjectContainer, onCreateCharFunc : Function, onShowInfoAlertFunc : Function)
		{
			super();
			_onCreateCharFunc = onCreateCharFunc;
			_onShowInfoAlertFunc = onShowInfoAlertFunc;
			_stage = Starling.current.nativeStage;

			parent.addChild(this);

			_createHeroSkin = new CreateHeroSkin();
			_createHeroSkin.toSprite(this);

			_heroListContainer = new Sprite();
			_createHeroSkin.container.addChild(_heroListContainer);
			_heroListSkin = new HeroListSkin();
			_heroListSkin.toSprite(_heroListContainer);
			_heroListContainer.touchable = true;
			_heroListContainer.touchGroup = true;

			_heroBtnListContainer = new Sprite();
			_createHeroSkin.container.addChild(_heroBtnListContainer);
			_heroBtnListSkin = new HeroBtnListSkin();
			_heroBtnListSkin.toSprite(_heroBtnListContainer);

			_heroNameContainer = new Sprite();
			_createHeroSkin.container.addChild(_heroNameContainer);
			_heroNameInputSkin = new HeroNameInputSkin();
			_heroNameInputSkin.toSprite(_heroNameContainer);

			_stepTitleContainer = new Sprite();
			_createHeroSkin.container.addChild(_stepTitleContainer);
			_heroStepTitleSkin = new HeroStepTitleSkin();
			_heroStepTitleSkin.toSprite(_stepTitleContainer);

			_heroFaceListContainer = new Sprite();
			_createHeroSkin.container.addChild(_heroFaceListContainer);
			_heroFaceListSkin = new HeroFaceListSkin();
			_heroFaceListSkin.toSprite(_heroFaceListContainer);

			_heroNameInputSkin.infoTxt.text = "";

			_heroNameInputSkin.heroNameText.verticalAlign = "middle";
			UIStateSetHelper.setTextInputFormat(_heroNameInputSkin.heroNameText, new TextFormat("SimHei", 14, 0xffffff, true, null, null, null, null, "center"));

			var radio : Radio;

			_faceRadios = [];
			_faceRadios.push(_heroFaceListSkin.faceBtn1);
			_faceRadios.push(_heroFaceListSkin.faceBtn2);
			_faceRadios.push(_heroFaceListSkin.faceBtn3);
			_faceRadios.push(_heroFaceListSkin.faceBtn4);
			_faceRadios.push(_heroFaceListSkin.faceBtn5);
			_faceRadios.push(_heroFaceListSkin.faceBtn6);
			_faceRadios.push(_heroFaceListSkin.faceBtn7);
			_faceRadios.push(_heroFaceListSkin.faceBtn8);
			for each (radio in _faceRadios)
			{
				radio.groupName = "CreateHeroFaceGroup";
			}
			(_faceRadios[_face - 1] as Radio).isSelected = true;

			_countryRadios = [];
			_countryRadios.push(_heroNameInputSkin.country1);
			_countryRadios.push(_heroNameInputSkin.country2);
			_countryRadios.push(_heroNameInputSkin.country3);
			_countryRadios.push(_heroNameInputSkin.country4);
			_countryRadios.push(_heroNameInputSkin.country5);
			for each (radio in _countryRadios)
			{
				radio.groupName = "CreateHeroCountryGroup";
			}
			(_countryRadios[_country - 1] as Radio).isSelected = true;

			_countryJianTxts = [];
			_countryJianTxts.push(_heroNameInputSkin.countryJian1);
			_countryJianTxts.push(_heroNameInputSkin.countryJian2);
			_countryJianTxts.push(_heroNameInputSkin.countryJian3);
			_countryJianTxts.push(_heroNameInputSkin.countryJian4);
			_countryJianTxts.push(_heroNameInputSkin.countryJian5);
			var len : int = _countryJianTxts.length;
			for (var i : int = 0; i < len; i++)
			{
				var countryJianTxt : UIAsset = _countryJianTxts[i];
				if (i == 3)
					countryJianTxt.visible = true;
				else
					countryJianTxt.visible = false;
			}

			_manFaces = [];
			_manFaces.push(_heroFaceListSkin.man1);
			_manFaces.push(_heroFaceListSkin.man2);
			_manFaces.push(_heroFaceListSkin.man3);
			_manFaces.push(_heroFaceListSkin.man4);
			_manFaces.push(_heroFaceListSkin.man5);
			_manFaces.push(_heroFaceListSkin.man6);
			_manFaces.push(_heroFaceListSkin.man7);
			_manFaces.push(_heroFaceListSkin.man8);

			_womanFaces = [];
			_womanFaces.push(_heroFaceListSkin.woman1);
			_womanFaces.push(_heroFaceListSkin.woman2);
			_womanFaces.push(_heroFaceListSkin.woman3);
			_womanFaces.push(_heroFaceListSkin.woman4);
			_womanFaces.push(_heroFaceListSkin.woman5);
			_womanFaces.push(_heroFaceListSkin.woman6);
			_womanFaces.push(_heroFaceListSkin.woman7);
			_womanFaces.push(_heroFaceListSkin.woman8);

			var hitArea : PixelHitArea;

//			var juese3Bmd : BitmapData = GuiTheme.ins.getTextureBitmapData(_heroListSkin.role3.styleName);
//			if (juese3Bmd)
//			{
//				hitArea = PixelHitArea.createHitArea("juese3", juese3Bmd);
//				hitArea.x = _heroListSkin.role3.x;
//				hitArea.y = _heroListSkin.role3.y;
//			}
//
//			var juese4Bmd : BitmapData = GuiTheme.ins.getTextureBitmapData(_heroListSkin.role4.styleName);
//			if (juese4Bmd)
//			{
//				hitArea = PixelHitArea.createHitArea("juese4", juese4Bmd);
//				hitArea.x = _heroListSkin.role4.x;
//				hitArea.y = _heroListSkin.role4.y;
//			}

			var juese2Bmd : BitmapData = GuiTheme.ins.getTextureBitmapData(_heroListSkin.role2.styleName);
			if (juese2Bmd)
			{
				hitArea = PixelHitArea.createHitArea("juese2", juese2Bmd);
				hitArea.x = _heroListSkin.role2.x;
				hitArea.y = _heroListSkin.role2.y;
			}

			var juese1Bmd : BitmapData = GuiTheme.ins.getTextureBitmapData(_heroListSkin.role1.styleName);
			if (juese1Bmd)
			{
				hitArea = PixelHitArea.createHitArea("juese1", juese1Bmd);
				hitArea.x = _heroListSkin.role1.x;
				hitArea.y = _heroListSkin.role1.y;
			}

			onStageResize();
			_stage.addEventListener(Event.RESIZE, onStageResize);
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);

			selectedRoleIndex = 0;
			gotoStepSelectHero();

			onRandom();

			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);

//			_localPoint.x = _heroListContainer.x;
//			_localPoint.y = _heroListContainer.y;
//			_heroListContainer.parent.localToGlobal(_localPoint, _globalPoint);
			//	PixelHitArea.debugPrintAreas(_globalPoint.x, _globalPoint.y);
		}

		private function onStageResize(e : Event = null) : void
		{
			this.x = int((_stage.stageWidth - _createHeroSkin.bgImage.width) * 0.5);
			this.y = int((_stage.stageHeight - _createHeroSkin.bgImage.height) * 0.5);

////			LoginManager.screenContainer.screenX = this.x + _avatarOffX;
////			LoginManager.screenContainer.screenY = this.y + _avatarOffY;

			_heroBtnListContainer.y = (_stage.stageHeight < _createHeroSkin.bgImage.height ? -(_createHeroSkin.bgImage.height - _stage.stageHeight) * 0.5 : 0);
			_heroNameContainer.y = (_stage.stageHeight < _createHeroSkin.bgImage.height ? -(_createHeroSkin.bgImage.height - _stage.stageHeight) * 0.5 : 0);

			_createHeroSkin.bottomInfo.y = (_stage.stageHeight < _createHeroSkin.bgImage.height ? 885 - (_createHeroSkin.bgImage.height - _stage.stageHeight) * 0.5 : 885);

			_heroBtnListSkin.backBtn.x = (_stage.stageWidth < _createHeroSkin.bgImage.width ? 50 + (_createHeroSkin.bgImage.width - _stage.stageWidth) * 0.5 : 50);
			_heroBtnListSkin.nextBtn.x = (_stage.stageWidth < _createHeroSkin.bgImage.width ? 1388 - (_createHeroSkin.bgImage.width - _stage.stageWidth) * 0.5 : 1388);
		}

		private function gotoStepSelectHero() : void
		{
			_step = STEP_SELECT_HERO;
			_heroStepTitleSkin.step1Title.visible = true;
			_heroStepTitleSkin.step2Title.visible = false;
			_heroStepTitleSkin.step3Title.visible = false;

			updateSelectedHero();

			_heroNameContainer.visible = false;
			_heroFaceListContainer.visible = false;
			_heroBtnListSkin.backBtn.visible = false;
		}

		/*private function gotoStepSelectFace() : void
		{
			_step = STEP_SELECT_FACE;
			_heroStepTitleSkin.step1Title.visible = false;
			_heroStepTitleSkin.step2Title.visible = true;
			_heroStepTitleSkin.step3Title.visible = false;

			showSelectedHero();

			_heroNameContainer.visible = false;
			_heroFaceListContainer.visible = true;
			updateSexFace(_sex);
		}*/

		private function gotoStepNameInput() : void
		{
			_step = STEP_NAME_INPUT;
			_heroStepTitleSkin.step1Title.visible = false;
			_heroStepTitleSkin.step2Title.visible = false;
			_heroStepTitleSkin.step3Title.visible = true;

			showSelectedHero();

			_heroNameContainer.visible = true;
			_heroFaceListContainer.visible = false;
			_heroBtnListSkin.backBtn.visible = true;
		}

		public function setInfo(msg : String) : void
		{
			_heroNameInputSkin.infoTxt.text = msg;
		}

		private function updateSexFace(sex : int) : void
		{
			var len : int = _manFaces.length;
			for (var i : int = 0; i < len; i++)
			{
				var manFace : UIAsset = _manFaces[i];
				manFace.visible = sex == 1;
				var womanFace : UIAsset = _womanFaces[i];
				womanFace.visible = sex != 1;
			}
		}

		private function updateSelectedHero() : void
		{
			_heroListSkin.role1.visible = true;
			_heroListSkin.role1.x = 335;
			_heroListSkin.role1.y = 155;

			_heroListSkin.role2.visible = true;
			_heroListSkin.role2.x = 675;
			_heroListSkin.role2.y = 155;

//			_heroListSkin.role3.visible = true;
//			_heroListSkin.role3.x = 896;
//			_heroListSkin.role3.y = 232;
//
//			_heroListSkin.role4.visible = true;
//			_heroListSkin.role4.x = 626;
//			_heroListSkin.role4.y = 148;

			if (_selectedRoleIndex == 0)
			{
				_heroListSkin.role1.filter = null;
				GrayFilter.gray(_heroListSkin.role2);
			}
			else if(_selectedRoleIndex == 1)
			{
				_heroListSkin.role2.filter = null;
				GrayFilter.gray(_heroListSkin.role1);
			}

//			if (_selectedRoleIndex == 2)
//			{
//				_heroListSkin.role3.filter = null;
//			}
//			else
//			{
//				GrayFilter.gray(_heroListSkin.role3);
//			}
//
//			if (_selectedRoleIndex == 3)
//			{
//				_heroListSkin.role4.filter = null;
//			}
//			else
//			{
//				GrayFilter.gray(_heroListSkin.role4);
//			}
		}

		private function showSelectedHero() : void
		{
			_heroListSkin.role1.x = 570;
			_heroListSkin.role1.y = 155;

			_heroListSkin.role2.x = 500;
			_heroListSkin.role2.y = 155;

//			_heroListSkin.role3.x = 596;
//			_heroListSkin.role3.y = 232;
//
//			_heroListSkin.role4.x = 726;
//			_heroListSkin.role4.y = 248;

			if (_selectedRoleIndex == 0)
			{
				_heroListSkin.role1.visible = true;
			}
			else
			{
				_heroListSkin.role1.visible = false;
			}

			if (_selectedRoleIndex == 1)
			{
				_heroListSkin.role2.visible = true;
			}
			else
			{
				_heroListSkin.role2.visible = false;
			}

//			if (_selectedRoleIndex == 2)
//			{
//				_heroListSkin.role3.visible = true;
//			}
//			else
//			{
//				_heroListSkin.role3.visible = false;
//			}
//
//			if (_selectedRoleIndex == 3)
//			{
//				_heroListSkin.role4.visible = true;
//			}
//			else
//			{
//				_heroListSkin.role4.visible = false;
//			}
		}

		private function gotoNextStep() : void
		{
			if (_step == STEP_SELECT_HERO)
				gotoStepNameInput();
			else if (_step == STEP_NAME_INPUT)
				startGame();
		}

		private function gotoBackStep() : void
		{
			if (_step == STEP_NAME_INPUT)
				gotoStepSelectHero();
		}

		/**
		 * 0: body=1,sex=0
		 * 1: body=1,sex=1
		 * 2: body=0,sex=0
		 * 3: body=0,sex=1
		 */
		public function set selectedRoleIndex(value : int) : void
		{
			_selectedRoleIndex = value;
			switch (_selectedRoleIndex)
			{
				case 0:
					_body = 1;
					_sex = 0;
					break;
				case 1:
					_body = 1;
					_sex = 1;
					break;
				case 2:
					_body = 0;
					_sex = 0;
					break;
				case 3:
					_body = 0;
					_sex = 1;
					break;
			}
		}

		/**
		 * 名字
		 * @return
		 *
		 */
		public function get nickName() : String
		{
			return _nickName;
		}

		public function get country() : int
		{
			return _country;
		}

		public function get face() : int
		{
			return _face;
		}

		public function get body() : int
		{
			return _body;
		}

		public function get sex() : int
		{
			return _sex;
		}

		protected function onTouch(e : TouchEvent) : void
		{
			var t : Touch = e.getTouch(this, TouchPhase.HOVER);
			if (t != null && t.target != null)
			{
				//暂时只是一个角色。
//				if (t.target == _heroListSkin.juese_jr)
//				{
//					if (_lastHoverHero != _heroListSkin.juese_jr)
//					{
//						_lastHoverHero = _heroListSkin.juese_jr;
//						_lastHoverHero.filter = BlurFilter.createGlow(0xffff33, 0.5, 100);
//						_lastHoverHero.scaleX = _lastHoverHero.scaleY = 0.90;
//						TweenMax.to(_heroListSkin.juese_jr, 1, {y: 400, repeat: -1, yoyo: true, ease: Linear.easeNone});
//					}
//				}
//				else
//				{
//					unSelectHoverHero();
//				}
			}
			else
			{
				t = e.getTouch(this, TouchPhase.ENDED);
				if (t != null && t.target != null)
				{
					if (t.target == _heroBtnListSkin.nextBtn)
					{
						gotoNextStep();
					}
					else if (t.target == _heroBtnListSkin.backBtn)
					{
						gotoBackStep();
					}
					else if (t.target == _heroNameInputSkin.randomBtn)
					{
						onRandom();
					}
					else if (t.target == _heroListContainer)
					{
						if (_step == STEP_SELECT_HERO)
						{
							_globalPoint.x = t.globalX;
							_globalPoint.y = t.globalY;
							_heroListContainer.globalToLocal(_globalPoint, _localPoint);
							var hitArea : PixelHitArea = PixelHitArea.hitTest(_localPoint);
							var hitName : String = hitArea ? hitArea.name : null;
							switch (hitName)
							{
								case "juese1":
									selectedRoleIndex = 0;
									break;
								case "juese2":
									selectedRoleIndex = 1;
									break;
								case "juese3":
									selectedRoleIndex = 2;
									break;
								case "juese4":
									selectedRoleIndex = 3;
									break;
							}
							updateSelectedHero();
						}
					}
					else
					{
						switch (t.target)
						{
							case _heroNameInputSkin.country1:
								_country = CountryTypeEnum.YI_ZHOU;
								break;
							case _heroNameInputSkin.country2:
								_country = CountryTypeEnum.JING_ZHOU;
								break;
							case _heroNameInputSkin.country3:
								_country = CountryTypeEnum.YANG_ZHOU;
								break;
							case _heroNameInputSkin.country4:
								_country = CountryTypeEnum.QING_ZHOU;
								break;
							case _heroNameInputSkin.country5:
								_country = CountryTypeEnum.YOU_ZHOU;
								break;
						}

						var faceIndex : int = _faceRadios.indexOf(t.target);
						if (faceIndex > -1)
							_face = faceIndex + 1;
					}
						//暂时只是一个角色。
//					if (t.target == _heroListSkin.juese_jr)
//					{
//						selectedHero(1);
//					}

//					else 
				}
			}
		}

		private function onKeyDown(e : KeyboardEvent) : void
		{
			if (e.keyCode == Keyboard.ENTER)
			{
				gotoNextStep();
			}
		}

		/**
		 * 随机名字
		 * @param event
		 */
		protected function onRandom() : void
		{
			_heroNameInputSkin.heroNameText.text = RandomNick.randomNick(true);
		}

		private function selectedHero(id : int) : void
		{

		}

//		override public function set x(value : Number) : void
//		{
//			super.x = value;
//			LoginManager.screenContainer.screenX = this.x + _avatarOffX;
//		}
//
//		override public function set y(value : Number) : void
//		{
//			super.y = value;
//			LoginManager.screenContainer.screenY = this.y + _avatarOffY;
//		}

		public function destroy() : void
		{
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouch);
			if (_stage)
			{
				_stage.removeEventListener(Event.RESIZE, onStageResize);
				_stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
				_stage = null;
			}
			PixelHitArea.disposeAll();
			_onCreateCharFunc = null;
			_onShowInfoAlertFunc = null;

			_createHeroSkin = null;
			_heroListSkin = null;
			_heroBtnListSkin = null;
			_heroNameInputSkin = null;
			_heroStepTitleSkin = null;
			_heroFaceListSkin = null;

			if (_countryRadios)
			{
				_countryRadios.length = 0;
				_countryRadios = null;
			}
			if (_countryJianTxts)
			{
				_countryJianTxts.length = 0;
				_countryJianTxts = null;
			}
			if (_faceRadios)
			{
				_faceRadios.length = 0;
				_faceRadios = null;
			}
			if (_manFaces)
			{
				_manFaces.length = 0;
				_manFaces = null;
			}
			if (_womanFaces)
			{
				_womanFaces.length = 0;
				_womanFaces = null;
			}

			if (_heroListContainer)
			{
				DisplayUtil.disposeDisplayContainer(_heroListContainer);
				_heroListContainer = null;
			}
			if (_heroBtnListContainer)
			{
				DisplayUtil.disposeDisplayContainer(_heroBtnListContainer);
				_heroBtnListContainer = null;
			}
			if (_heroNameContainer)
			{
				DisplayUtil.disposeDisplayContainer(_heroNameContainer);
				_heroNameContainer = null;
			}
			if (_stepTitleContainer)
			{
				DisplayUtil.disposeDisplayContainer(_stepTitleContainer);
				_stepTitleContainer = null;
			}
			if (_heroFaceListContainer)
			{
				DisplayUtil.disposeDisplayContainer(_heroFaceListContainer);
				_heroFaceListContainer = null;
			}
			if (parent)
				parent.removeChild(this);
			DisplayUtil.disposeDisplayContainer(this);
		}

		private function startGame() : void
		{
			if (!_heroNameInputSkin.heroNameText.text)
			{
				showInfoAlert("请输入角色名称");
				return;
			}

//			if (_heroNameInputSkin.heroNameText.text == "请输入你的名字吧")
//			{
//				//setErrorTipsPos();
//				//_tipsText.text = "请输入角色名称";
//				//_tipsCanvas.visible = true;
//				return;
//			}

			if (StringFilter.checkBadWords(_heroNameInputSkin.heroNameText.text))
			{
				showInfoAlert("包含非法字符");
				return;
			}

			var curString : String = _heroNameInputSkin.heroNameText.text;
			var curLen : int = getStringLen(curString);

			if (-1 == curLen)
			{
				showInfoAlert("只能输入中文，字母，数字");
				_heroNameInputSkin.heroNameText.text = _previousChar;
				return;
			}

			if (curLen > MAX_CHARS)
			{
				showInfoAlert("请输入3-14个字符（汉字占2个字符）");
				_heroNameInputSkin.heroNameText.text = _previousChar;
				return;
			}

			if (curLen < MIN_CHARS)
			{
				showInfoAlert("请输入3-14个字符（汉字占2个字符）");
			}
			else
			{
			}

			_previousChar = curString;
			_heroNameInputSkin.heroNameText.text = curString;

			_nickName = _heroNameInputSkin.heroNameText.text;
			if (_onCreateCharFunc != null)
				_onCreateCharFunc();
		}

		private function showInfoAlert(info : String) : void
		{
			if (_onShowInfoAlertFunc != null)
				_onShowInfoAlertFunc(info);
		}

		/**
		 * 得到一个字符串的字节长度
		 * @param $str		字符串
		 * @return
		 * @author 卢国征
		 */
		private function getStringLen($str : String) : int
		{
			var len : int = $str.length;
			var ret : int = 0;
			var charCode : uint;
			var charCodeLen : int;
			for (var idx : int = 0; idx < len; idx++)
			{
				charCode = $str.charCodeAt(idx);
				charCodeLen = getCharLen(charCode);
				if (0 == charCodeLen)
				{
					return -1; // 含有非法字符
				}
				ret += charCodeLen;
			}
			return ret;
		}

		/**
		 * 是否有非法字符
		 * @param charcode
		 * @return
		 * @author 卢国征
		 */
		public function isWideChars(charcode : Number) : Boolean
		{
			// 如果是英文字母和汉字，优先判定
			if (charcode < 0x80) // 英文
			{
				return false;
			}

			if (charcode >= 0x4E00 && charcode <= 0x9FFF) // 常用汉字
			{
				return true;
			}
			return ((charcode >= 0x1100 && charcode <= 0x115f) || /* Hangul Jamo */ (charcode >= 0x2e80 && charcode <= 0xa4cf && (charcode & ~0x0011) != 0x300a && charcode != 0x303f) || /* CJK ... Yi */ (charcode >= 0xac00 && charcode <= 0xd7a3) || /* Hangul Syllables */ (charcode >= 0xf900 && charcode <= 0xfaff) || /* CJK Compatibility Ideographs */ (charcode >= 0xfe30 && charcode <= 0xfe6f) || /* CJK Compatibility Forms */ (charcode >= 0xff00 && charcode <= 0xff5f) || /* Fullwidth Forms */ (charcode >= 0xffe0 && charcode <= 0xffe6) || ((charcode >= 0x2600 && charcode <= 0x2671) /* 实物体字符 1*/ && !(charcode >= 0x2639 && charcode <= 0x263C) && !(charcode >= 0x2660 && charcode <= 0x2666) && charcode != 0x2669 && charcode != 0x266b && charcode != 0x266c && charcode != 0x266e && charcode != 0x266f && charcode != 0x2670) || (charcode >= 0x2700 && charcode <= 0x27FF) /* 实物体字符 2*/);
		}

		/**
		 * 得到一个字符的字节长度
		 * @param $charCode     Unicode 字符代码
		 * @return
		 * @author 卢国征
		 */
		private function getCharLen($charCode : uint) : int
		{
			if ($charCode >= 19968 && $charCode <= 40895)
				return 2;
			if (($charCode >= CHAR_a && $charCode <= CHAR_z) || ($charCode >= CHAR_A && $charCode <= CHAR_Z) || ($charCode >= CHAR_0 && $charCode <= CHAR_9))
				return 1;
			return 0;
		}
	}
}
