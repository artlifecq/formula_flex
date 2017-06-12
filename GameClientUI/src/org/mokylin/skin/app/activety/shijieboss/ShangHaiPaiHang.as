package org.mokylin.skin.app.activety.shijieboss
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShangHaiPaiHang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShangHaiPaiHang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 383;
			this.width = 286;
			this.elementsContent = [__ShangHaiPaiHang_UIAsset1_i(),__ShangHaiPaiHang_UIAsset2_i(),__ShangHaiPaiHang_UIAsset3_i(),__ShangHaiPaiHang_UIAsset4_i(),btn_open_i(),btn_close_i(),__ShangHaiPaiHang_UIAsset5_i(),__ShangHaiPaiHang_Label1_i(),__ShangHaiPaiHang_Label2_i(),__ShangHaiPaiHang_UIAsset6_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShangHaiPaiHang_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "我的伤害：$";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 8;
			temp.y = 313;
			return temp;
		}

		private function __ShangHaiPaiHang_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "我的排名：$";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 8;
			temp.y = 333;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 383;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 286;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/bossbg.jpg";
			temp.x = 3;
			temp.y = 305;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/titledi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/bosspaihang.png";
			temp.x = 37;
			temp.y = 4;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/zuihoulyijiwanjia.png";
			temp.x = 38;
			temp.y = 356;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/shengwang.png";
			temp.x = 215;
			temp.y = 320;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}