package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipChongshu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Xinfa_Tips2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var gridSkill:feathers.controls.UIAsset;

		public var imgBg:feathers.controls.UIAsset;

		public var imgJiHuoTitle:feathers.controls.UIAsset;

		public var imgSkill:feathers.controls.UIAsset;

		public var imgXS:feathers.controls.UIAsset;

		public var lab_name:feathers.controls.Label;

		public var lab_shuxing:feathers.controls.Label;

		public var lab_shuxing2:feathers.controls.Label;

		public var lab_xiangsheng:feathers.controls.Label;

		public var mcLevel:feathers.controls.UIMovieClip;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Xinfa_Tips2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 439;
			this.width = 281;
			this.elementsContent = [imgBg_i(),lab_xiangsheng_i(),imgXS_i(),gridSkill_i(),imgSkill_i(),imgJiHuoTitle_i(),lab_shuxing2_i(),lab_shuxing_i(),__Xinfa_Tips2_UIAsset2_i(),__Xinfa_Tips2_UIAsset3_i(),mcLevel_i(),__Xinfa_Tips2_UIAsset4_i(),lab_name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Xinfa_Tips2_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/zhuangtai.png";
			temp.x = 32;
			temp.y = 44;
			return temp;
		}

		private function __Xinfa_Tips2_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/yinzhangheng.png";
			temp.x = 82;
			temp.y = 39;
			return temp;
		}

		private function __Xinfa_Tips2_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 12;
			temp.y = 30;
			return temp;
		}

		private function gridSkill_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gridSkill = temp;
			temp.name = "gridSkill";
			temp.styleName = "ui/common/jinsekuang.png";
			temp.x = 32;
			temp.y = 205;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 439;
			temp.styleName = "ui/common/tips/diban.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgJiHuoTitle_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgJiHuoTitle = temp;
			temp.name = "imgJiHuoTitle";
			temp.styleName = "ui/app/beibao/xinfa/jihuojiangli2.png";
			temp.x = 32;
			temp.y = 141;
			return temp;
		}

		private function imgSkill_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSkill = temp;
			temp.name = "imgSkill";
			temp.styleName = "ui/app/beibao/xinfa/xinfajiyi.png";
			temp.x = 32;
			temp.y = 187;
			return temp;
		}

		private function imgXS_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgXS = temp;
			temp.name = "imgXS";
			temp.styleName = "ui/app/beibao/xinfa/xinfaxiangsheng.png";
			temp.x = 32;
			temp.y = 262;
			return temp;
		}

		private function lab_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_name = temp;
			temp.name = "lab_name";
			temp.letterSpacing = 7;
			temp.fontSize = 18;
			temp.text = "龙象";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 117;
			temp.y = 6;
			return temp;
		}

		private function lab_shuxing2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_shuxing2 = temp;
			temp.name = "lab_shuxing2";
			temp.text = "体力：";
			temp.color = 0xB8AD80;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 149;
			temp.y = 68;
			return temp;
		}

		private function lab_shuxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_shuxing = temp;
			temp.name = "lab_shuxing";
			temp.text = "体力：";
			temp.color = 0xB8AD80;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 30;
			temp.y = 68;
			return temp;
		}

		private function lab_xiangsheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_xiangsheng = temp;
			temp.name = "lab_xiangsheng";
			temp.height = 19;
			temp.text = "与XXX相生";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 202;
			temp.x = 30;
			temp.y = 284;
			return temp;
		}

		private function mcLevel_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mcLevel = temp;
			temp.name = "mcLevel";
			temp.autoPlay = false;
			temp.height = 18;
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipChongshu;
			temp.width = 52;
			temp.x = 90;
			temp.y = 42;
			return temp;
		}

	}
}