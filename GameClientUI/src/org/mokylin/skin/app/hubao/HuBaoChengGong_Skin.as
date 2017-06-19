package org.mokylin.skin.app.hubao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuBaoChengGong_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg_shuangbei:feathers.controls.UIAsset;

		public var btnCancel:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var lbCaiLiao:feathers.controls.Label;

		public var lbTiShi:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbjiangli:feathers.controls.Label;

		public var lbjingyan:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuBaoChengGong_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 353;
			this.width = 654;
			this.elementsContent = [__HuBaoChengGong_Skin_UIAsset1_i(),__HuBaoChengGong_Skin_UIAsset2_i(),bg_shuangbei_i(),icon1_i(),icon2_i(),icon3_i(),lbCaiLiao_i(),lbjingyan_i(),lbjiangli_i(),lbTiShi_i(),lbTime_i(),btnCancel_i(),btnOk_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HuBaoChengGong_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hubao/hubaochenggongbg.png";
			temp.x = 0;
			temp.y = 91;
			return temp;
		}

		private function __HuBaoChengGong_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hubao/hubaochenggong.png";
			temp.x = 159;
			temp.y = 0;
			return temp;
		}

		private function bg_shuangbei_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_shuangbei = temp;
			temp.name = "bg_shuangbei";
			temp.styleName = "ui/app/hubao/shuangbei.png";
			temp.x = 193;
			temp.y = 125;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 95;
			temp.x = 192;
			temp.y = 298;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确定";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 89;
			temp.x = 330;
			temp.y = 300;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/iconkuang_64.jpg";
			temp.x = 169;
			temp.y = 169;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/iconkuang_64.jpg";
			temp.x = 292;
			temp.y = 169;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.height = 70;
			temp.styleName = "ui/common/iconkuang_64.jpg";
			temp.width = 70;
			temp.x = 415;
			temp.y = 169;
			return temp;
		}

		private function lbCaiLiao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCaiLiao = temp;
			temp.name = "lbCaiLiao";
			temp.htmlText = "护宝旗<font color='#5DBD37'>x2</font>";
			temp.text = "标签";
			temp.textAlign = "left";
			temp.color = 0x9D4AA8;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 103;
			temp.x = 169;
			temp.y = 242;
			return temp;
		}

		private function lbTiShi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTiShi = temp;
			temp.name = "lbTiShi";
			temp.htmlText = "您还剩<font color='#5DBD37'>2</font>次护送机会，是否继续？";
			temp.text = "你还有";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 220;
			temp.x = 206;
			temp.y = 273;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "7秒后自动关闭";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 425;
			temp.y = 300;
			return temp;
		}

		private function lbjiangli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbjiangli = temp;
			temp.name = "lbjiangli";
			temp.htmlText = "护宝旗<font color='#5DBD37'>x2</font>";
			temp.text = "标签";
			temp.textAlign = "left";
			temp.color = 0x9D4AA8;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 103;
			temp.x = 415;
			temp.y = 242;
			return temp;
		}

		private function lbjingyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbjingyan = temp;
			temp.name = "lbjingyan";
			temp.htmlText = "护宝旗<font color='#5DBD37'>x2</font>";
			temp.text = "标签";
			temp.textAlign = "left";
			temp.color = 0x9D4AA8;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 103;
			temp.x = 292;
			temp.y = 242;
			return temp;
		}

	}
}