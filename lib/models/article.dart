
// articles of the newsletter section ... 
class Article {
  final String id;
  final String title;
  final String excerpt;
  final String content;
  final String imageUrl;
  final String author;
  final DateTime publishedAt;
  int likesCount;
  final int commentsCount;

  Article({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.publishedAt,
    required this.likesCount,
    required this.commentsCount,
  });

  Map<String, dynamic> ToMap() {
    return {
      'id': id,
      'title': title,
      'excerpt': excerpt,
      'content': content,
      'imageUrl': imageUrl,
      'author': author,
    };
  }

  

}


 final articles = [
      Article(
         id: '1',
        title: 'Quick Commerce',
        excerpt: 'The New Frontier for Big Companies Like Reliance',
        content: "In the ever-evolving landscape of retail, quick commerce has emerged as a game-changer, redefining the parameters of convenience and speed. Big players like Reliance are spearheading this revolution, capitalizing on the swelling demand for ultra-fast delivery services. Lets delve into how Reliance and other giants are navigating this dynamic field and what it means for the future of retail.\n\nReliance's Bold Move into Quick Commerce\nReliance Retail, the retail arm of Reliance Industries, is no stranger to innovation. With its latest foray into quick commerce, Reliance aims to disrupt the market by offering lightning-fast delivery services through its e-commerce platform, JioMart. This strategic move positions Reliance as a formidable contender in a space dominated by the likes of Blinkit, Swiggy Instamart, and Zepto.\nWhat sets Reliance apart is its extensive network of over 3,000 retail stores across India. Instead of relying solely on dark stores which are small warehouses closer to customers, Reliance plans to leverage its existing stores for fulfillment. This approach not only ensures faster delivery times but also optimizes the use of current infrastructure, reducing the need for significant additional investment.\n\nExpanding Accessibility and Reach\nOne of Reliance's key strategies is to extend quick commerce services beyond the metropolitan areas. While most competitors focus on urban centers, Reliance is keen on tapping into the semi-urban and rural markets. By doing so, they aim to democratize quick commerce, making rapid deliveries accessible to a wider population.\n\nCompetitive Edge Through Affordability\nIn a bid to attract a larger customer base, Reliance is offering several incentives:\n1.  Free Delivery: By eliminating delivery charges, Reliance lowers the barrier for entry, making it an attractive option for cost-conscious consumers.\n2. No Platform Fees: Unlike some services that charge a small fee for using their platform, JioMart provides a more affordable alternative.\n3.  No Surge Pricing: Consistency in pricing ensures that customers aren't deterred by fluctuating costs, particularly during peak times\n\nReliance's Strategic Alliances\nReliance's partnerships with local businesses play a crucial role in its quick commerce strategy. Collaborating with local kirana stores allows for a more robust and efficient delivery network, ensuring that even the most remote areas can enjoy the benefits of quick commerce. This symbiotic relationship not only enhances Reliance's reach but also supports local businesses by integrating them into the digital economy.\n\nTechnological Innovations\nAt the heart of Reliance's quick commerce initiative is cutting-edge technology. Advanced algorithms, AI, and machine learning drive the efficiency of their operations. These technologies help predict demand patterns, optimize delivery routes, and ensure that inventory management is seamless. The result is a well-oiled machine that can deliver goods to your doorstep in record time.\n\nThe Competitive Landscape\nWhile Reliance is making significant inroads, it faces stiff competition from established players:\n\n1.  Blinkit: Known for its promise of delivering groceries and essentials within minutes, Blinkit has a robust network of dark stores strategically placed in key urban areas.\n2.  Swiggy Instamart: Leveraging its extensive food delivery network, Swiggy has successfully transitioned into quick commerce, offering a diverse range of products with swift delivery times.\n3. Zepto: A rising star in the quick commerce sector, Zepto focuses on hyperlocal delivery models, ensuring that customers receive their orders in a flash.\n\nFuture Prospects\nThe quick commerce market is poised for exponential growth. As competition intensifies, companies will continue to innovate, focusing on enhancing customer experience and expanding their reach. Reliance's entry into this space underscores its commitment to staying at the forefront of retail innovation, leveraging its vast resources and strategic vision to reshape the market.\n\nConclusion\nBig companies like Reliance are redefining the quick commerce landscape. With their expansive reach, technological prowess, and customer-centric approach, they are well-positioned to lead this transformative journey. As consumers, we can look forward to a future where convenience is just a click away, and ultra-fast delivery becomes the norm.",
        imageUrl: 'https://tradebrains.in/wp-content/uploads/2020/09/jio-mart-app-1024x768.jpg',
        author: 'EDC VIIT',
        publishedAt: DateTime.now(),
        likesCount: 42,
        commentsCount: 12,
      ),
      Article(
        id: '2',
        title: 'Ideas to Innovation',
        excerpt: 'Navigating the Business and Start-up Frontier',
        content: ".",
        imageUrl: 'https://thumbs.dreamstime.com/b/innovation-technology-business-innovative-idea-innovation-technology-business-innovative-idea-concept-icons-211252027.jpg',
        author: 'EDC VIIT',
        publishedAt: DateTime.now(),
        likesCount: 43,
        commentsCount: 10,
      ),
      Article(
        id: '3',
        title: 'Computer Generated Imagery(CGI) in Advertising',
        excerpt: 'CGI:Transforming marketing through immersive storytelling.',
        content: ".",
        imageUrl: 'https://www.adotrip.com/public/images/areas/master_images/5c53ea4b15861-Gateway_Of_India_Attractions.jpg',
        author: 'EDC VIIT',
        publishedAt: DateTime.now(),
        likesCount: 40,
        commentsCount: 16,
      ),
      Article(
        id: '4',
        title: 'Students Study in Abroad Industry in 2024',
        excerpt: 'Global Opportunities: Your gateway to global education.',
        content: ".",
        imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.AgTnOMxNyXajpgouWprUugHaFD&pid=Api&P=0&h=180',
        author: 'EDC VIIT',
        publishedAt: DateTime.now(),
        likesCount: 40,
        commentsCount: 16,
      ),
      // Add more mock articles as needed
    ];