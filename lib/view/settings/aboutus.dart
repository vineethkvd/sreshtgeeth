import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/base_colors.dart';
import 'package:sreshtgeeth/common/text.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var htmldata4 = r"""
<p><strong>About Sresth Geeth</strong></p>

<p>&nbsp;</p>

<p>Welcome to Sresth Geeth Which is owned and operated by Rejoice Music India Pvt Ltd, your gateway to a soul-enriching journey through the power of Christian music. We are dedicated to providing you with a unique and spiritually uplifting experience through the gift of music.</p>

<p>&nbsp;</p>

<p><strong>Our Mission</strong></p>

<p>At Sresth Geeth, our mission is to create a space where believers can find solace, inspiration, and a deeper connection with their faith through the harmonious beauty of Christian music. We believe that music has the ability to touch hearts, heal souls, and bring individuals closer to their spiritual journey</p>

<p><strong>What We Offer</strong></p>

<ul>
	<li><strong>Extensive Christian Music Library:</strong> &nbsp;Our app offers an extensive collection of Christian songs, hymns, gospel music, and worship tunes that span various denominations and styles. From contemporary worship to timeless classics, we aim to cater to diverse tastes and preferences.</li>
</ul>

<p>&nbsp;</p>

<ul>
	<li><strong>Personalized Worship Experience:</strong> With personalized playlists and recommendations tailored to your spiritual journey, we strive to provide a meaningful worship experience that resonates with your faith and beliefs.</li>
</ul>

<p>&nbsp;</p>

<ul>
	<li><strong>Devotional Content:</strong> Explore a treasure trove of devotional content, including lyrics, Bible verses, and reflections, accompanying your favorite songs to deepen your spiritual understanding.</li>
</ul>

<p>&nbsp;</p>

<ul>
	<li><strong>High-Quality Sound:</strong> Immerse yourself in the uplifting melodies and messages of faith with high-quality audio streaming, ensuring your worship experience is of the utmost clarity and depth.</li>
</ul>

<p>&nbsp;</p>

<ul>
	<li><strong>Offline Worship: </strong>&nbsp;Take your faith with you wherever you go. Download your favorite Christian songs, sermons, and devotionals to listen even when you&amp;#39;re offline</li>
</ul>

<p>&nbsp;</p>

<ul>
	<li><strong>Community and Fellowship:</strong> Connect with like-minded individuals who share your faith, join discussion groups, and share your favorite songs and inspirational moments with others in our Christian community.</li>
</ul>

<p>&nbsp;</p>

<p><strong>Our Team</strong></p>

<p>Behind Sresth Geeth is a team of dedicated believers who are passionate about combining technology and faith to provide a platform that brings people closer to God through music. Our team includes individuals with diverse backgrounds, but we all share a common goal: to serve and uplift the Christian community.</p>

<p>&nbsp;</p>

<p><strong>Contact Us</strong></p>

<p><strong>Email:</strong> <a href="mailto:feedback.RejoiceMusic@gmail.com">feedback.RejoiceMusic@gmail.com</a></p>

<p><strong>Address:</strong> Flat No 304 Vijaya Sai residency Back Side KKR Cinima hall Near Chuttugunta Circle Guntur - 522004&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

<p><strong>Stay Connected</strong></p>

<p>Keep up with the latest Christian music trends, devotionals, and community activities by following us on social media:</p>

<p><strong>Facebook</strong></p>

<p><strong>Twitter</strong></p>

<p><strong>Instagram</strong></p>

<p>Thank you for choosing Sresth Geeth as your spiritual companion. We are honored to be part of your faith journey and to provide you with music that uplifts your spirit and draws you closer to God.</p>

<p>&nbsp;</p>

""";
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SingleChildScrollView(
      child: Column(
        children: [
          Row(
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
              onPressed: () => Get.back(),
                  ),
              ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Txt(text: 'About Us',fsize: 18,weight: FontWeight.w500,),
                    )
          ],
        ),
           Container(
      height: 1500,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Html(data: htmldata4,),
    )),
        ],
      ),
    )),);
  }
}