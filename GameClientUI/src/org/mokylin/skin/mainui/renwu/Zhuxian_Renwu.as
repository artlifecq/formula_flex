package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zhuxian_Renwu extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var ioc_0:feathers.controls.UIAsset;

		public var lb_jiangli:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_speak:feathers.controls.Label;

		public var lb_time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhuxian_Renwu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 376;
			this.width = 298;
			this.elementsContent = [bg_i(),__Zhuxian_Renwu_UIAsset1_i(),__Zhuxian_Renwu_UIAsset2_i(),btnClose_i(),btn_ok_i(),__Zhuxian_Renwu_UIAsset3_i(),lb_name_i(),__Zhuxian_Renwu_UIAsset4_i(),lb_jiangli_i(),lb_speak_i(),ioc_0_i(),lb_time_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zhuxian_Renwu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/background/zhuxianrenwu.png";
			temp.x = 106;
			temp.y = 9;
			return temp;
		}

		private function __Zhuxian_Renwu_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 61;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.top = 42;
			temp.width = 268;
			temp.x = 16;
			return temp;
		}

		private function __Zhuxian_Renwu_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/tiao2.png";
			temp.x = 25;
			temp.y = 49;
			return temp;
		}

		private function __Zhuxian_Renwu_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/tiao2.png";
			temp.x = 25;
			temp.y = 160;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 376;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 298;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 264;
			temp.y = 7;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "领取奖励";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 105;
			temp.x = 100;
			temp.y = 325;
			return temp;
		}

		private function ioc_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_0 = temp;
			temp.name = "ioc_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 22;
			temp.y = 186;
			return temp;
		}

		private function lb_jiangli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jiangli = temp;
			temp.name = "lb_jiangli";
			temp.text = "任务奖励：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 252;
			temp.x = 25;
			temp.y = 164;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.text = "第九十九章：章节名称六子";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 252;
			temp.x = 24;
			temp.y = 52;
			return temp;
		}

		private function lb_speak_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_speak = temp;
			temp.name = "lb_speak";
			temp.height = 80;
			temp.text = "NPC对话框";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 246;
			temp.x = 25;
			temp.y = 75;
			return temp;
		}

		private function lb_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_time = temp;
			temp.name = "lb_time";
			temp.text = "n秒后自动领取奖励";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 210;
			temp.x = 47;
			temp.y = 291;
			return temp;
		}

	}
}