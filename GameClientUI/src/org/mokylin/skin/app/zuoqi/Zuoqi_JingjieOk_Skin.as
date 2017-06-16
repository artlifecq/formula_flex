package org.mokylin.skin.app.zuoqi
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zuoqi.button.ButtonLingqu;
	import org.mokylin.skin.app.zuoqi.mc.UIMovieClipZuoqiName;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv;
	import org.mokylin.skin.component.uinumber.UINumberZhanli_min;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zuoqi_JingjieOk_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnOk:feathers.controls.Button;

		public var ico1:feathers.controls.UIAsset;

		public var ico2:feathers.controls.UIAsset;

		public var mc_name:feathers.controls.UIMovieClip;

		public var num_lv:feathers.controls.UINumber;

		public var uiGuangquan:feathers.controls.UIAsset;

		public var ui_zhandouli:feathers.controls.UIAsset;

		public var userData:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zuoqi_JingjieOk_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 434;
			this.width = 868;
			this.elementsContent = [uiGuangquan_i(),bg_i(),mc_name_i(),btnOk_i(),ui_zhandouli_i(),userData_i(),num_lv_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/big_bg/zuoqi/bg3.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.styleClass = org.mokylin.skin.app.zuoqi.button.ButtonLingqu;
			temp.x = 522;
			temp.y = 331;
			return temp;
		}

		private function mc_name_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_name = temp;
			temp.name = "mc_name";
			temp.autoPlay = false;
			temp.height = 196;
			temp.styleClass = org.mokylin.skin.app.zuoqi.mc.UIMovieClipZuoqiName;
			temp.width = 83;
			temp.x = 67;
			temp.y = 72;
			return temp;
		}

		private function num_lv_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_lv = temp;
			temp.name = "num_lv";
			temp.gap = -4;
			temp.height = 25;
			temp.label = "x1000";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv;
			temp.width = 102;
			temp.x = 704;
			temp.y = 173;
			return temp;
		}

		private function uiGuangquan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiGuangquan = temp;
			temp.name = "uiGuangquan";
			temp.styleName = "ui/app/zuoqi/guangquan.png";
			temp.x = 86;
			temp.y = 70;
			return temp;
		}

		private function ui_zhandouli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandouli = temp;
			temp.name = "ui_zhandouli";
			temp.styleName = "ui/app/zuoqi/zhandouli.png";
			temp.x = 504;
			temp.y = 170;
			return temp;
		}

		private function userData_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			userData = temp;
			temp.name = "userData";
			temp.gap = -4;
			temp.height = 38;
			temp.label = "31415";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberZhanli_min;
			temp.width = 116;
			temp.x = 596;
			temp.y = 170;
			return temp;
		}

	}
}