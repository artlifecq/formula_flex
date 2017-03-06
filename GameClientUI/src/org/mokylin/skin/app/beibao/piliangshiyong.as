package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class piliangshiyong extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var btns:feathers.controls.Group;

		public var contents:feathers.controls.Group;

		public var icon_all:feathers.controls.UIAsset;

		public var lbl_currentNum:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var lbl_num:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function piliangshiyong()
		{
			super();
			
			this.currentState = "normal";
			this.height = 250;
			this.width = 337;
			this.elementsContent = [bg_i(),__piliangshiyong_UIAsset1_i(),__piliangshiyong_UIAsset2_i(),lbl_title_i(),btnClose_i(),btn_ok_i(),btns_i(),contents_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __piliangshiyong_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "批量使用：";
			temp.color = 0x8b8d7b;
			temp.width = 76;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __piliangshiyong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 141;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 315;
			temp.x = 11;
			temp.y = 41;
			return temp;
		}

		private function __piliangshiyong_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 1;
			temp.styleName = "ui/common/fenggexian.png";
			temp.width = 284;
			temp.x = 28;
			temp.y = 137;
			return temp;
		}

		private function __piliangshiyong_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/common/background/xiaobiaotibeijing.png";
			temp.width = 74;
			temp.x = 103;
			temp.y = 1;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 250;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 337;
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
			temp.x = 301;
			temp.y = 7;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 169;
			temp.y = 3;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 88;
			temp.y = 3;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确认使用";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 109;
			temp.x = 118;
			temp.y = 195;
			return temp;
		}

		private function btns_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btns = temp;
			temp.name = "btns";
			temp.x = 34;
			temp.y = 147;
			temp.elementsContent = [__piliangshiyong_Label1_i(),__piliangshiyong_UIAsset3_i(),lbl_currentNum_i(),btn_min_i(),btn_max_i()];
			return temp;
		}

		private function contents_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			contents = temp;
			temp.name = "contents";
			temp.x = 30;
			temp.y = 49;
			temp.elementsContent = [icon_all_i(),lbl_name_i(),lbl_num_i()];
			return temp;
		}

		private function icon_all_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_all = temp;
			temp.name = "icon_all";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/60.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_currentNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_currentNum = temp;
			temp.name = "lbl_currentNum";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xF1EFC7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 62;
			temp.x = 109;
			temp.y = 5;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = false;
			temp.height = 26;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "讨伐卷轴（紫装）";
			temp.color = 0x9d4aa8;
			temp.width = 196;
			temp.x = 88;
			temp.y = 3;
			return temp;
		}

		private function lbl_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_num = temp;
			temp.name = "lbl_num";
			temp.height = 24;
			temp.text = "本组剩余：18";
			temp.color = 0xcfc6ae;
			temp.width = 104;
			temp.x = 90;
			temp.y = 33;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "批量使用";
			temp.textAlign = "center";
			temp.color = 0xb8ad80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 165;
			temp.x = 90;
			temp.y = 11;
			return temp;
		}

	}
}