package org.mokylin.skin.app.jianghu.lunjian
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_Nandu;
	import org.mokylin.skin.app.jianghu.mc.UIMovieClipNandu;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class LunJian_TiaoZhanItem extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnTiaozhan:feathers.controls.Button;

		public var lbLevel:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbZhanli:feathers.controls.Label;

		public var mc_nandu:feathers.controls.UIMovieClip;

		public var modeBg:feathers.controls.UIAsset;

		public var modeCont:feathers.controls.SkinnableContainer;

		public var sk_emeng:feathers.controls.SkinnableContainer;

		public var sk_jiandan:feathers.controls.SkinnableContainer;

		public var sk_kunnan:feathers.controls.SkinnableContainer;

		public var uiOK:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LunJian_TiaoZhanItem()
		{
			super();
			
			this.currentState = "normal";
			this.height = 486;
			this.width = 246;
			this.elementsContent = [__LunJian_TiaoZhanItem_UIAsset1_i(),modeBg_i(),modeCont_i(),lbName_i(),__LunJian_TiaoZhanItem_UIAsset2_i(),__LunJian_TiaoZhanItem_Label1_i(),__LunJian_TiaoZhanItem_Label2_i(),__LunJian_TiaoZhanItem_Label3_i(),lbLevel_i(),lbZhanli_i(),mc_nandu_i(),btnTiaozhan_i(),sk_jiandan_i(),sk_kunnan_i(),sk_emeng_i(),uiOK_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __LunJian_TiaoZhanItem_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "解锁等级：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 56;
			temp.y = 276;
			return temp;
		}

		private function __LunJian_TiaoZhanItem_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "推荐战力：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 56;
			temp.y = 255;
			return temp;
		}

		private function __LunJian_TiaoZhanItem_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前难度：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 56;
			temp.y = 299;
			return temp;
		}

		private function __LunJian_TiaoZhanItem_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/jianghu/lunjian/bgk.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __LunJian_TiaoZhanItem_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jianghu/lunjian/zezao.png";
			temp.x = 17;
			temp.y = 251;
			return temp;
		}

		private function btnTiaozhan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTiaozhan = temp;
			temp.name = "btnTiaozhan";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "开始挑战";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 65;
			temp.y = 328;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.fontSize = 16;
			temp.text = "Lv.45";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 82;
			temp.x = 128;
			temp.y = 276;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 16;
			temp.text = "名字共六个字";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 131;
			temp.x = 62;
			temp.y = 17;
			return temp;
		}

		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.fontSize = 16;
			temp.text = "123456";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 88;
			temp.x = 128;
			temp.y = 254;
			return temp;
		}

		private function mc_nandu_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_nandu = temp;
			temp.name = "mc_nandu";
			temp.autoPlay = false;
			temp.height = 17;
			temp.styleClass = org.mokylin.skin.app.jianghu.mc.UIMovieClipNandu;
			temp.width = 32;
			temp.x = 128;
			temp.y = 301;
			return temp;
		}

		private function modeBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			modeBg = temp;
			temp.name = "modeBg";
			temp.styleName = "ui/app/jianghu/lunjian/beijing1.jpg";
			temp.x = 18;
			temp.y = 43;
			return temp;
		}

		private function modeCont_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			modeCont = temp;
			temp.name = "modeCont";
			temp.height = 200;
			temp.width = 200;
			temp.x = 18;
			temp.y = 42;
			return temp;
		}

		private function sk_emeng_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_emeng = temp;
			temp.name = "sk_emeng";
			temp.height = 96;
			var skin:StateSkin = new org.mokylin.skin.app.jianghu.lunjian.LunJian_Nandu()
			temp.skin = skin
			temp.width = 70;
			temp.x = 155;
			temp.y = 371;
			return temp;
		}

		private function sk_jiandan_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_jiandan = temp;
			temp.name = "sk_jiandan";
			temp.height = 96;
			var skin:StateSkin = new org.mokylin.skin.app.jianghu.lunjian.LunJian_Nandu()
			temp.skin = skin
			temp.width = 70;
			temp.x = 12;
			temp.y = 371;
			return temp;
		}

		private function sk_kunnan_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_kunnan = temp;
			temp.name = "sk_kunnan";
			temp.height = 96;
			var skin:StateSkin = new org.mokylin.skin.app.jianghu.lunjian.LunJian_Nandu()
			temp.skin = skin
			temp.width = 70;
			temp.x = 84;
			temp.y = 371;
			return temp;
		}

		private function uiOK_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOK = temp;
			temp.name = "uiOK";
			temp.styleName = "ui/app/jianghu/lunjian/ytz.png";
			temp.x = 168;
			temp.y = 0;
			return temp;
		}

	}
}