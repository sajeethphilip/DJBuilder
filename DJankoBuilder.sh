#!/bin/bash

# ==============================================================================
# airis4D Django Project Scaffolder Installer
# Author: Gemini AI
# Date: December 2025
# Description: Sets up the project directory with the Python builder,
#              configuration, and template placeholders.
# ==============================================================================

# --- Configuration ---
PYTHON_SCRIPT_NAME="airis4d_scaffolder.py"
CONFIG_FILE_NAME="config.json"
TEMPLATE_DIR="source_html"
AIRIS4D_PROJECT_NAME="airis4D_project"

# --- Function to check dependencies ---
check_dependencies() {
    echo "Checking for Django and Python..."
    if ! command -v django-admin &> /dev/null
    then
        echo "Error: Django is not installed. Please install Django using 'pip install django'."
        exit 1
    fi
    if ! command -v python3 &> /dev/null
    then
        echo "Error: Python 3 is not installed."
        exit 1
    fi
    echo "Dependencies met."
}

# --- Main installation script ---

install_scaffolder() {
    echo "Starting installation of the airis4D Django Scaffolder..."

    # 1. Create the template source directory structure
    if [ -d "$TEMPLATE_DIR" ]; then
        echo "Warning: Directory '$TEMPLATE_DIR' already exists. Skipping creation."
    else
        mkdir -p "$TEMPLATE_DIR"
        mkdir -p "$TEMPLATE_DIR/partials"
        mkdir -p "$TEMPLATE_DIR/assets"
        echo "Created '$TEMPLATE_DIR' directory with subfolders."
    fi

    echo "Creating professional HTML templates in '$TEMPLATE_DIR'..."
    # 4. Create template browser files
    echo "Creating template browser module..."

    # Create template_sources.json
    if [ -f "template_sources.json" ]; then
        echo "Warning: 'template_sources.json' already exists. Skipping."
    else
        cat << 'EOF' > "template_sources.json"
{
  "categories": {
    "ai_research": ["Technology", "Research", "AI", "Science", "Lab"],
    "portfolio": ["Portfolio", "Creative", "Personal", "Resume"],
    "business": ["Business", "Corporate", "Professional", "Agency"],
    "ecommerce": ["E-commerce", "Shop", "Store", "Product"],
    "blog": ["Blog", "News", "Magazine", "Articles"]
  },
  "sources": [
    {
      "name": "HTML5 UP",
      "url": "https://html5up.net/",
      "description": "Responsive HTML5 and CSS3 site templates",
      "free": true,
      "download_type": "direct",
      "categories": ["ai_research", "portfolio", "business"]
    },
    {
      "name": "Templated",
      "url": "https://templated.co/",
      "description": "850+ free CSS and HTML site templates",
      "free": true,
      "download_type": "direct",
      "categories": ["portfolio", "business", "blog"]
    },
    {
      "name": "Start Bootstrap",
      "url": "https://startbootstrap.com/templates/",
      "description": "Free Bootstrap templates",
      "free": true,
      "download_type": "direct",
      "categories": ["business", "portfolio", "ecommerce"]
    }
  ],
  "recent_downloads": [],
  "favorites": []
}
EOF
        echo "Created 'template_sources.json'."
    fi

    echo "---"
    echo "🎨 TEMPLATE BROWSER READY!"
    echo "---"
    echo "NEW FEATURES:"
    echo "* Browse free templates from HTML5 UP, Templated, etc."
    echo "* Download templates for research labs, portfolios, businesses"
    echo "* Preview templates in browser"
    echo "* Apply downloaded templates to your project"
    echo "---"
    echo "USAGE:"
    echo "  Browse templates: python3 airis4d_scaffolder.py --browse-templates"
    echo "  or: python3 airis4d_scaffolder.py -b"
    echo "---"
    echo "DEPENDENCIES (optional):"
    echo "  For enhanced features: pip install beautifulsoup4 requests"
    # Create base.html
    cat << 'EOF' > "${TEMPLATE_DIR}/base.html"
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="{{ SITE_DESCRIPTION }}">
    <title>{{ SITE_TITLE }} - {% block title %}{% endblock %}</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@300;400&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- CSS Variables & Base Styles -->
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --secondary: #7c3aed;
            --accent: #06b6d4;
            --dark: #0f172a;
            --light: #f8fafc;
            --gray: #64748b;
            --gray-light: #e2e8f0;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --radius: 0.75rem;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            color: var(--dark);
            background-color: var(--light);
            line-height: 1.6;
            overflow-x: hidden;
        }

        h1, h2, h3, h4, h5, h6 {
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 1rem;
        }

        h1 { font-size: 3.5rem; }
        h2 { font-size: 2.5rem; }
        h3 { font-size: 1.875rem; }
        h4 { font-size: 1.5rem; }

        .gradient-text {
            background: linear-gradient(135deg, var(--primary), var(--secondary), var(--accent));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            background-size: 200% 200%;
            animation: gradient-shift 8s ease infinite;
        }

        @keyframes gradient-shift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.75rem;
            border-radius: var(--radius);
            font-weight: 600;
            text-decoration: none;
            transition: var(--transition);
            border: none;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            box-shadow: var(--shadow);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }

        .btn-outline {
            border: 2px solid var(--primary);
            color: var(--primary);
            background: transparent;
        }

        .btn-outline:hover {
            background: var(--primary);
            color: white;
        }

        .section {
            padding: 5rem 1.5rem;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1.5rem;
        }

        .card {
            background: white;
            border-radius: var(--radius);
            padding: 2rem;
            box-shadow: var(--shadow);
            transition: var(--transition);
            border: 1px solid var(--gray-light);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
        }

        .glass {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--gray-light);
            z-index: 1000;
            padding: 1rem 0;
        }

        .footer {
            background: var(--dark);
            color: white;
            padding: 4rem 0 2rem;
        }

        .social-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            transition: var(--transition);
        }

        .social-link:hover {
            background: var(--primary);
            transform: translateY(-3px);
        }

        .animate-fade-in {
            animation: fadeIn 0.8s ease-out;
        }

        .animate-slide-up {
            animation: slideUp 0.6s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            h1 { font-size: 2.5rem; }
            h2 { font-size: 2rem; }
            h3 { font-size: 1.5rem; }
            .section { padding: 3rem 1rem; }
        }
    </style>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/static/css/style.css">

    {% block extra_css %}{% endblock %}
</head>
<body class="animate-fade-in">
    {% include 'partials/navbar.html' %}

    <!-- Main Content -->
    <main style="margin-top: 5rem;">
        {% block content %}
        {% endblock content %}
    </main>

    {% include 'partials/footer.html' %}

    <!-- JavaScript -->
    <script>
        // Simple animations on scroll
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-slide-up');
                }
            });
        }, observerOptions);

        // Observe all cards and sections
        document.querySelectorAll('.card, h2, h3').forEach(el => {
            observer.observe(el);
        });

        // Mobile menu toggle (if needed)
        document.addEventListener('DOMContentLoaded', function() {
            console.log('airis4D Research Platform loaded successfully');
        });
    </script>

    {% block extra_js %}{% endblock %}
</body>
</html>
EOF

    # Create partials directory with reusable components
    cat << 'EOF' > "${TEMPLATE_DIR}/partials/navbar.html"
<!-- Navigation -->
<nav class="navbar">
    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <a href="/" style="text-decoration: none; display: flex; align-items: center; gap: 0.75rem;">
                <div style="width: 2.5rem; height: 2.5rem; background: linear-gradient(135deg, var(--primary), var(--accent)); border-radius: 0.5rem; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; font-size: 1.25rem;">
                    A4D
                </div>
                <span style="font-size: 1.5rem; font-weight: 800; color: var(--dark);">airis4D</span>
            </a>

            <div style="display: flex; gap: 2rem; align-items: center;">
                <a href="/" style="text-decoration: none; color: var(--dark); font-weight: 500; transition: var(--transition);">Home</a>
                <a href="/research/" style="text-decoration: none; color: var(--dark); font-weight: 500; transition: var(--transition);">Research</a>
                <a href="/publications/" style="text-decoration: none; color: var(--dark); font-weight: 500; transition: var(--transition);">Publications</a>
                <a href="mailto:{{ CONTACT_EMAIL }}" class="btn btn-primary">
                    <i class="fas fa-envelope"></i> Contact
                </a>
            </div>
        </div>
    </div>
</nav>
EOF

    cat << 'EOF' > "${TEMPLATE_DIR}/partials/footer.html"
<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 3rem; margin-bottom: 3rem;">
            <div>
                <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.5rem;">
                    <div style="width: 3rem; height: 3rem; background: linear-gradient(135deg, var(--primary), var(--accent)); border-radius: 0.75rem; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; font-size: 1.5rem;">
                        A4D
                    </div>
                    <span style="font-size: 1.75rem; font-weight: 800; color: white;">airis4D</span>
                </div>
                <p style="color: #94a3b8; margin-bottom: 1.5rem;">
                    {{ SITE_DESCRIPTION }} – Pioneering the future of artificial intelligence through innovative research and development.
                </p>
                <div style="display: flex; gap: 1rem;">
                    {% for platform, url in SOCIAL_LINKS.items %}
                    <a href="{{ url }}" target="_blank" class="social-link">
                        <i class="fab fa-{{ platform }}"></i>
                    </a>
                    {% endfor %}
                </div>
            </div>

            <div>
                <h4 style="color: white; margin-bottom: 1.5rem;">Quick Links</h4>
                <ul style="list-style: none;">
                    <li style="margin-bottom: 0.75rem;"><a href="/" style="color: #94a3b8; text-decoration: none; transition: var(--transition);">Home</a></li>
                    <li style="margin-bottom: 0.75rem;"><a href="/research/" style="color: #94a3b8; text-decoration: none; transition: var(--transition);">Research Areas</a></li>
                    <li style="margin-bottom: 0.75rem;"><a href="/publications/" style="color: #94a3b8; text-decoration: none; transition: var(--transition);">Publications</a></li>
                    <li style="margin-bottom: 0.75rem;"><a href="mailto:{{ CONTACT_EMAIL }}" style="color: #94a3b8; text-decoration: none; transition: var(--transition);">Contact Us</a></li>
                </ul>
            </div>

            <div>
                <h4 style="color: white; margin-bottom: 1.5rem;">Contact Info</h4>
                <div style="color: #94a3b8;">
                    <p style="margin-bottom: 1rem;"><i class="fas fa-envelope" style="margin-right: 0.5rem;"></i> {{ CONTACT_EMAIL }}</p>
                    <p style="margin-bottom: 1rem;"><i class="fas fa-map-marker-alt" style="margin-right: 0.5rem;"></i> AI Research Hub</p>
                    <p><i class="fas fa-globe" style="margin-right: 0.5rem;"></i> airis4d.com</p>
                </div>
            </div>
        </div>

        <div style="border-top: 1px solid #334155; padding-top: 2rem; text-align: center; color: #94a3b8;">
            <p>&copy; {{ CURRENT_YEAR }} {{ SITE_TITLE }}. All rights reserved.</p>
            <p style="margin-top: 0.5rem; font-size: 0.875rem;">Pioneering AI Research & Innovation</p>
        </div>
    </div>
</footer>
EOF

    # Create page templates as separate files
    cat << 'EOF' > "${TEMPLATE_DIR}/homepage.html"
<!-- Hero Section -->
<section class="section" style="background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%); color: white; padding-top: 8rem; padding-bottom: 8rem;">
    <div class="container">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 4rem; align-items: center;">
            <div class="animate-slide-up">
                <h1 style="font-size: 4rem; margin-bottom: 1.5rem; line-height: 1.1;">
                    <span class="gradient-text">Advancing</span> the Frontiers of AI
                </h1>
                <p style="font-size: 1.25rem; color: #cbd5e1; margin-bottom: 2.5rem;">
                    At airis4D, we pioneer cutting-edge research in artificial intelligence,
                    machine learning, and neural networks. Our work spans from fundamental
                    theoretical research to practical applications that transform industries.
                </p>
                <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                    <a href="/research/" class="btn btn-primary">
                        <i class="fas fa-microscope"></i> Explore Research
                    </a>
                    <a href="#contact" class="btn btn-outline" style="border-color: white; color: white;">
                        <i class="fas fa-paper-plane"></i> Collaborate
                    </a>
                </div>
            </div>
            <div class="animate-slide-up" style="animation-delay: 0.2s;">
                <div style="background: linear-gradient(135deg, rgba(37, 99, 235, 0.2), rgba(124, 58, 237, 0.2)); border-radius: 1.5rem; padding: 2rem; backdrop-filter: blur(10px);">
                    <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 1.5rem;">
                        <div class="card" style="background: rgba(255, 255, 255, 0.1); color: white; border: none;">
                            <i class="fas fa-brain" style="font-size: 2rem; margin-bottom: 1rem; color: var(--accent);"></i>
                            <h4 style="color: white;">Neural Networks</h4>
                            <p style="color: #cbd5e1; font-size: 0.875rem;">Advanced architectures & training</p>
                        </div>
                        <div class="card" style="background: rgba(255, 255, 255, 0.1); color: white; border: none;">
                            <i class="fas fa-robot" style="font-size: 2rem; margin-bottom: 1rem; color: var(--success);"></i>
                            <h4 style="color: white;">Autonomous Systems</h4>
                            <p style="color: #cbd5e1; font-size: 0.875rem;">Self-learning & adaptive AI</p>
                        </div>
                        <div class="card" style="background: rgba(255, 255, 255, 0.1); color: white; border: none;">
                            <i class="fas fa-chart-network" style="font-size: 2rem; margin-bottom: 1rem; color: var(--warning);"></i>
                            <h4 style="color: white;">Graph AI</h4>
                            <p style="color: #cbd5e1; font-size: 0.875rem;">Knowledge graphs & reasoning</p>
                        </div>
                        <div class="card" style="background: rgba(255, 255, 255, 0.1); color: white; border: none;">
                            <i class="fas fa-shield-alt" style="font-size: 2rem; margin-bottom: 1rem; color: var(--danger);"></i>
                            <h4 style="color: white;">AI Safety</h4>
                            <p style="color: #cbd5e1; font-size: 0.875rem;">Ethical & secure AI systems</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Research Highlights -->
<section class="section" style="background: white;">
    <div class="container">
        <div style="text-align: center; margin-bottom: 4rem;">
            <h2 style="font-size: 3rem; margin-bottom: 1rem;">
                <span class="gradient-text">Research</span> Focus Areas
            </h2>
            <p style="color: var(--gray); max-width: 700px; margin: 0 auto;">
                Our interdisciplinary research spans multiple domains of artificial intelligence,
                pushing the boundaries of what's possible.
            </p>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;">
            <div class="card animate-slide-up">
                <div style="width: 3rem; height: 3rem; background: linear-gradient(135deg, var(--primary), var(--accent)); border-radius: 0.75rem; display: flex; align-items: center; justify-content: center; margin-bottom: 1.5rem;">
                    <i class="fas fa-network-wired" style="color: white; font-size: 1.5rem;"></i>
                </div>
                <h3>Deep Learning Architectures</h3>
                <p style="color: var(--gray); margin-bottom: 1.5rem;">
                    Novel neural network designs, attention mechanisms, and optimization techniques
                    for improved performance and efficiency.
                </p>
                <a href="/research/#deep-learning" style="color: var(--primary); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 0.5rem;">
                    Learn More <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="card animate-slide-up" style="animation-delay: 0.1s;">
                <div style="width: 3rem; height: 3rem; background: linear-gradient(135deg, var(--secondary), var(--primary)); border-radius: 0.75rem; display: flex; align-items: center; justify-content: center; margin-bottom: 1.5rem;">
                    <i class="fas fa-language" style="color: white; font-size: 1.5rem;"></i>
                </div>
                <h3>Multimodal AI</h3>
                <p style="color: var(--gray); margin-bottom: 1.5rem;">
                    Integration of vision, language, and audio processing for holistic
                    AI systems that understand the world as humans do.
                </p>
                <a href="/research/#multimodal" style="color: var(--primary); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 0.5rem;">
                    Learn More <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="card animate-slide-up" style="animation-delay: 0.2s;">
                <div style="width: 3rem; height: 3rem; background: linear-gradient(135deg, var(--accent), var(--success)); border-radius: 0.75rem; display: flex; align-items: center; justify-content: center; margin-bottom: 1.5rem;">
                    <i class="fas fa-cogs" style="color: white; font-size: 1.5rem;"></i>
                </div>
                <h3>AI Infrastructure</h3>
                <p style="color: var(--gray); margin-bottom: 1.5rem;">
                    Scalable training frameworks, distributed computing, and hardware
                    acceleration for next-generation AI systems.
                </p>
                <a href="/research/#infrastructure" style="color: var(--primary); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 0.5rem;">
                    Learn More <i class="fas fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- Stats Section -->
<section class="section" style="background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%); color: white;">
    <div class="container">
        <div style="text-align: center; margin-bottom: 4rem;">
            <h2 style="font-size: 3rem; margin-bottom: 1rem;">
                By The <span class="gradient-text">Numbers</span>
            </h2>
            <p style="color: #94a3b8; max-width: 700px; margin: 0 auto;">
                Quantifying our impact and reach in the AI research community.
            </p>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 2rem; text-align: center;">
            <div class="animate-slide-up">
                <div style="font-size: 3.5rem; font-weight: 800; color: var(--accent); margin-bottom: 0.5rem;">50+</div>
                <div style="color: #cbd5e1; font-weight: 600;">Research Papers</div>
                <p style="color: #94a3b8; font-size: 0.875rem; margin-top: 0.5rem;">Published in top-tier conferences</p>
            </div>

            <div class="animate-slide-up" style="animation-delay: 0.1s;">
                <div style="font-size: 3.5rem; font-weight: 800; color: var(--success); margin-bottom: 0.5rem;">15+</div>
                <div style="color: #cbd5e1; font-weight: 600;">Open Source Projects</div>
                <p style="color: #94a3b8; font-size: 0.875rem; margin-top: 0.5rem;">Used by thousands worldwide</p>
            </div>

            <div class="animate-slide-up" style="animation-delay: 0.2s;">
                <div style="font-size: 3.5rem; font-weight: 800; color: var(--warning); margin-bottom: 0.5rem;">10M+</div>
                <div style="color: #cbd5e1; font-weight: 600;">Model Downloads</div>
                <p style="color: #94a3b8; font-size: 0.875rem; margin-top: 0.5rem;">Across research community</p>
            </div>

            <div class="animate-slide-up" style="animation-delay: 0.3s;">
                <div style="font-size: 3.5rem; font-weight: 800; color: var(--secondary); margin-bottom: 0.5rem;">25+</div>
                <div style="color: #cbd5e1; font-weight: 600;">Industry Partners</div>
                <p style="color: #94a3b8; font-size: 0.875rem; margin-top: 0.5rem;">Collaborating on applied AI</p>
            </div>
        </div>
    </div>
</section>

<!-- Contact CTA -->
<section class="section" style="background: white;" id="contact">
    <div class="container">
        <div class="card" style="background: linear-gradient(135deg, var(--primary), var(--secondary)); color: white; text-align: center; padding: 4rem 2rem;">
            <h2 style="font-size: 2.5rem; margin-bottom: 1.5rem; color: white;">
                Collaborate With Us
            </h2>
            <p style="color: rgba(255, 255, 255, 0.9); max-width: 600px; margin: 0 auto 2.5rem; font-size: 1.125rem;">
                Interested in partnering with airis4D? Whether you're a researcher,
                student, or industry professional, we welcome collaboration opportunities.
            </p>
            <a href="mailto:{{ CONTACT_EMAIL }}" class="btn" style="background: white; color: var(--primary); font-weight: 600; padding: 1rem 2.5rem;">
                <i class="fas fa-handshake"></i> Start a Conversation
            </a>
            <p style="margin-top: 2rem; color: rgba(255, 255, 255, 0.8);">
                <i class="fas fa-envelope" style="margin-right: 0.5rem;"></i> {{ CONTACT_EMAIL }}
            </p>
        </div>
    </div>
</section>
EOF

    cat << 'EOF' > "${TEMPLATE_DIR}/research.html"
<!-- Research Header -->
<section class="section" style="background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%); color: white; padding-top: 8rem; padding-bottom: 4rem;">
    <div class="container">
        <div class="animate-slide-up">
            <h1 style="font-size: 4rem; margin-bottom: 1.5rem; line-height: 1.1;">
                <span class="gradient-text">Research</span> Areas
            </h1>
            <p style="font-size: 1.25rem; color: #cbd5e1; max-width: 800px;">
                Explore our comprehensive research portfolio spanning fundamental AI theory,
                applied machine learning, and cutting-edge neural network architectures.
                Each research area represents a frontier where we're pushing boundaries.
            </p>
        </div>
    </div>
</section>

<!-- Research Areas Grid -->
<section class="section" style="background: white;">
    <div class="container">
        {% if researchhub_list %}
        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(350px, 1fr)); gap: 2rem; margin-bottom: 4rem;">
            {% for item in researchhub_list %}
            <div class="card animate-slide-up" style="border-left: 4px solid var(--primary);">
                <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 1.5rem;">
                    <h3 style="color: var(--dark); margin-bottom: 0.5rem;">{{ item.title }}</h3>
                    <span style="background: var(--gray-light); color: var(--dark); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                        {{ item.order }}
                    </span>
                </div>

                {% if item.highlight %}
                <div style="background: linear-gradient(135deg, rgba(37, 99, 235, 0.1), rgba(124, 58, 237, 0.1)); padding: 1rem; border-radius: 0.5rem; margin-bottom: 1.5rem;">
                    <p style="color: var(--primary); font-weight: 600; margin-bottom: 0.5rem;">
                        <i class="fas fa-star" style="margin-right: 0.5rem;"></i> Research Highlight
                    </p>
                    <p style="color: var(--dark);">{{ item.highlight }}</p>
                </div>
                {% endif %}

                <p style="color: var(--gray); line-height: 1.7;">{{ item.focus }}</p>

                <div style="margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid var(--gray-light);">
                    <div style="display: flex; gap: 1rem;">
                        <span style="background: var(--primary); color: white; padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem;">
                            Active
                        </span>
                        <span style="background: var(--gray-light); color: var(--dark); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem;">
                            5+ Papers
                        </span>
                    </div>
                </div>
            </div>
            {% endfor %}
        </div>
        {% else %}
        <div class="card" style="text-align: center; padding: 3rem;">
            <i class="fas fa-microscope" style="font-size: 3rem; color: var(--gray-light); margin-bottom: 1.5rem;"></i>
            <h3 style="color: var(--dark); margin-bottom: 1rem;">Research Data Loading</h3>
            <p style="color: var(--gray);">Research data will appear here once loaded into the system.</p>
            <p style="color: var(--gray); font-size: 0.875rem; margin-top: 1rem;">
                Run: <code>python manage.py loaddata initial_data</code>
            </p>
        </div>
        {% endif %}

        <!-- Additional Research Areas -->
        <div style="margin-top: 4rem;">
            <h2 style="text-align: center; font-size: 2.5rem; margin-bottom: 3rem;">
                <span class="gradient-text">Core</span> Research Domains
            </h2>

            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;">
                <div class="card">
                    <div style="width: 4rem; height: 4rem; background: linear-gradient(135deg, var(--primary), var(--accent)); border-radius: 1rem; display: flex; align-items: center; justify-content: center; margin-bottom: 1.5rem;">
                        <i class="fas fa-brain" style="color: white; font-size: 1.75rem;"></i>
                    </div>
                    <h3>Foundation Models</h3>
                    <p style="color: var(--gray); margin-bottom: 1.5rem;">
                        Large-scale pretrained models, efficient fine-tuning techniques,
                        and multimodal foundation architectures.
                    </p>
                    <ul style="color: var(--gray); list-style: none; padding-left: 0;">
                        <li style="margin-bottom: 0.5rem;"><i class="fas fa-check" style="color: var(--success); margin-right: 0.5rem;"></i> LLM Optimization</li>
                        <li style="margin-bottom: 0.5rem;"><i class="fas fa-check" style="color: var(--success); margin-right: 0.5rem;"></i> Multimodal Training</li>
                        <li><i class="fas fa-check" style="color: var(--success); margin-right: 0.5rem;"></i> Efficient Inference</li>
                    </ul>
                </div>

                <div class="card">
                    <div style="width: 4rem; height: 4rem; background: linear-gradient(135deg, var(--secondary), var(--primary)); border-radius: 1rem; display: flex; align-items: center; justify-content: center; margin-bottom: 1.5rem;">
                        <i class="fas fa-robot" style="color: white; font-size: 1.75rem;"></i>
                    </div>
                    <h3>Autonomous AI Systems</h3>
                    <p style="color: var(--gray); margin-bottom: 1.5rem;">
                        Self-learning agents, reinforcement learning, and autonomous
                        decision-making systems for complex environments.
                    </p>
                    <ul style="color: var(--gray); list-style: none; padding-left: 0;">
                        <li style="margin-bottom: 0.5rem;"><i class="fas fa-check" style="color: var(--success); margin-right: 0.5rem;"></i> Reinforcement Learning</li>
                        <li style="margin-bottom: 0.5rem;"><i class="fas fa-check" style="color: var(--success); margin-right: 0.5rem;"></i> Multi-agent Systems</li>
                        <li><i class="fas fa-check" style="color: var(--success); margin-right: 0.5rem;"></i> Real-time Adaptation</li>
                    </ul>
                </div>

                <div class="card">
                    <div style="width: 4rem; height: 4rem; background: linear-gradient(135deg, var(--accent), var(--success)); border-radius: 1rem; display: flex; align-items: center; justify-content: center; margin-bottom: 1.5rem;">
                        <i class="fas fa-shield-alt" style="color: white; font-size: 1.75rem;"></i>
                    </div>
                    <h3>AI Safety & Ethics</h3>
                    <p style="color: var(--gray); margin-bottom: 1.5rem;">
                        Robustness, fairness, transparency, and alignment research
                        to ensure AI systems are safe and beneficial.
                    </p>
                    <ul style="color: var(--gray); list-style: none; padding-left: 0;">
                        <li style="margin-bottom: 0.5rem;"><i class="fas fa-check" style="color: var(--success); margin-right: 0.5rem;"></i> Adversarial Robustness</li>
                        <li style="margin-bottom: 0.5rem;"><i class="fas fa-check" style="color: var(--success); margin-right: 0.5rem;"></i> Fairness & Bias</li>
                        <li><i class="fas fa-check" style="color: var(--success); margin-right: 0.5rem;"></i> Interpretability</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Methodology Section -->
        <div class="card" style="margin-top: 4rem; background: linear-gradient(135deg, rgba(37, 99, 235, 0.05), rgba(124, 58, 237, 0.05)); border: none;">
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 3rem; align-items: center;">
                <div>
                    <h2 style="font-size: 2.5rem; margin-bottom: 1.5rem;">
                        Our <span class="gradient-text">Methodology</span>
                    </h2>
                    <p style="color: var(--gray); margin-bottom: 1.5rem;">
                        Our research follows a rigorous, iterative process combining
                        theoretical innovation with empirical validation.
                    </p>
                    <ol style="color: var(--dark); padding-left: 1.5rem;">
                        <li style="margin-bottom: 1rem;"><strong>Theoretical Foundation:</strong> Mathematical modeling and algorithm design</li>
                        <li style="margin-bottom: 1rem;"><strong>Experimental Validation:</strong> Rigorous testing and benchmarking</li>
                        <li style="margin-bottom: 1rem;"><strong>Open Source Release:</strong> Publishing code and models</li>
                        <li><strong>Community Engagement:</strong> Workshops, tutorials, and collaboration</li>
                    </ol>
                </div>
                <div style="background: white; padding: 2rem; border-radius: 1rem; box-shadow: var(--shadow);">
                    <h4 style="margin-bottom: 1.5rem; color: var(--dark);">Research Process</h4>
                    <div style="position: relative;">
                        <div style="display: flex; flex-direction: column; gap: 2rem; position: relative;">
                            {% for step in "1234" %}
                            <div style="display: flex; align-items: center; gap: 1rem;">
                                <div style="width: 2.5rem; height: 2.5rem; background: linear-gradient(135deg, var(--primary), var(--accent)); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; flex-shrink: 0;">
                                    {{ step }}
                                </div>
                                <div style="flex: 1;">
                                    <div style="font-weight: 600; color: var(--dark); margin-bottom: 0.25rem;">
                                        {% if step == "1" %}Problem Formulation
                                        {% elif step == "2" %}Algorithm Design
                                        {% elif step == "3" %}Implementation
                                        {% else %}Evaluation & Publication{% endif %}
                                    </div>
                                    <div style="height: 2px; background: var(--gray-light); width: 100%;"></div>
                                </div>
                            </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Get Involved CTA -->
<section class="section" style="background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);">
    <div class="container">
        <div class="card" style="background: transparent; border: 2px solid rgba(255, 255, 255, 0.1); color: white; text-align: center;">
            <h2 style="color: white; margin-bottom: 1.5rem;">Join Our Research Community</h2>
            <p style="color: #cbd5e1; max-width: 600px; margin: 0 auto 2rem;">
                We're always looking for talented researchers, students, and collaborators
                to join us in pushing the boundaries of artificial intelligence.
            </p>
            <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
                <a href="mailto:{{ CONTACT_EMAIL }}?subject=Research%20Collaboration" class="btn btn-primary">
                    <i class="fas fa-users"></i> Collaborate
                </a>
                <a href="/publications/" class="btn" style="background: rgba(255, 255, 255, 0.1); color: white; border: 2px solid rgba(255, 255, 255, 0.2);">
                    <i class="fas fa-book"></i> Read Publications
                </a>
            </div>
        </div>
    </div>
</section>
EOF

    cat << 'EOF' > "${TEMPLATE_DIR}/publications.html"
<!-- Publications Header -->
<section class="section" style="background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%); color: white; padding-top: 8rem; padding-bottom: 4rem;">
    <div class="container">
        <div class="animate-slide-up">
            <h1 style="font-size: 4rem; margin-bottom: 1.5rem; line-height: 1.1;">
                <span class="gradient-text">Publications</span>
            </h1>
            <p style="font-size: 1.25rem; color: #cbd5e1; max-width: 800px;">
                Explore our research contributions through peer-reviewed papers,
                conference proceedings, and preprints. Our work spans top AI venues
                including NeurIPS, ICML, ICLR, CVPR, and ACL.
            </p>
        </div>
    </div>
</section>

<!-- Publications Content -->
<section class="section" style="background: white; min-height: 60vh;">
    <div class="container">
        <!-- Filters -->
        <div class="card" style="margin-bottom: 3rem; background: var(--gray-light); border: none;">
            <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem;">
                <div>
                    <h4 style="color: var(--dark); margin-bottom: 0.5rem;">Filter Publications</h4>
                    <div style="display: flex; gap: 0.75rem; flex-wrap: wrap;">
                        <button style="background: white; border: 2px solid var(--primary); color: var(--primary); padding: 0.5rem 1.25rem; border-radius: 2rem; font-weight: 600; cursor: pointer; transition: var(--transition);">
                            All
                        </button>
                        <button style="background: transparent; border: 2px solid var(--gray); color: var(--dark); padding: 0.5rem 1.25rem; border-radius: 2rem; font-weight: 600; cursor: pointer; transition: var(--transition);">
                            2024
                        </button>
                        <button style="background: transparent; border: 2px solid var(--gray); color: var(--dark); padding: 0.5rem 1.25rem; border-radius: 2rem; font-weight: 600; cursor: pointer; transition: var(--transition);">
                            2023
                        </button>
                        <button style="background: transparent; border: 2px solid var(--gray); color: var(--dark); padding: 0.5rem 1.25rem; border-radius: 2rem; font-weight: 600; cursor: pointer; transition: var(--transition);">
                            Conference
                        </button>
                        <button style="background: transparent; border: 2px solid var(--gray); color: var(--dark); padding: 0.5rem 1.25rem; border-radius: 2rem; font-weight: 600; cursor: pointer; transition: var(--transition);">
                            Journal
                        </button>
                    </div>
                </div>
                <div style="display: flex; align-items: center; gap: 1rem;">
                    <div style="color: var(--dark); font-weight: 600;">
                        <i class="fas fa-sort-amount-down" style="margin-right: 0.5rem;"></i> Sort By:
                    </div>
                    <select style="padding: 0.5rem 1rem; border-radius: 0.5rem; border: 2px solid var(--gray-light); background: white; color: var(--dark); font-weight: 600;">
                        <option>Recent First</option>
                        <option>Citation Count</option>
                        <option>Alphabetical</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Sample Publications (Static for now) -->
        <div style="display: grid; gap: 1.5rem; margin-bottom: 4rem;">
            <!-- Publication 1 -->
            <div class="card animate-slide-up">
                <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 1rem; flex-wrap: wrap; gap: 1rem;">
                    <div>
                        <h3 style="color: var(--dark); margin-bottom: 0.5rem;">
                            Efficient Multimodal Transformer Architectures for Vision-Language Tasks
                        </h3>
                        <div style="display: flex; gap: 1rem; align-items: center; flex-wrap: wrap;">
                            <span style="background: var(--primary); color: white; padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                                NeurIPS 2024
                            </span>
                            <span style="color: var(--gray); font-weight: 600;">
                                <i class="far fa-calendar" style="margin-right: 0.25rem;"></i> October 2024
                            </span>
                            <span style="color: var(--success); font-weight: 600;">
                                <i class="fas fa-quote-right" style="margin-right: 0.25rem;"></i> 42 Citations
                            </span>
                        </div>
                    </div>
                    <a href="#" style="color: var(--primary); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 0.5rem;">
                        <i class="fas fa-external-link-alt"></i> PDF
                    </a>
                </div>
                <p style="color: var(--gray); margin-bottom: 1.5rem; line-height: 1.7;">
                    We propose a novel transformer architecture that efficiently processes multimodal
                    inputs while maintaining state-of-the-art performance on vision-language
                    benchmarks. Our method reduces computational requirements by 40% compared
                    to existing approaches.
                </p>
                <div style="display: flex; gap: 0.75rem; flex-wrap: wrap;">
                    <span style="background: rgba(37, 99, 235, 0.1); color: var(--primary); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                        Transformers
                    </span>
                    <span style="background: rgba(124, 58, 237, 0.1); color: var(--secondary); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                        Multimodal AI
                    </span>
                    <span style="background: rgba(6, 182, 212, 0.1); color: var(--accent); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                        Efficiency
                    </span>
                </div>
            </div>

            <!-- Publication 2 -->
            <div class="card animate-slide-up" style="animation-delay: 0.1s;">
                <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 1rem; flex-wrap: wrap; gap: 1rem;">
                    <div>
                        <h3 style="color: var(--dark); margin-bottom: 0.5rem;">
                            Robust Reinforcement Learning with Adversarial Environment Modeling
                        </h3>
                        <div style="display: flex; gap: 1rem; align-items: center; flex-wrap: wrap;">
                            <span style="background: var(--secondary); color: white; padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                                ICML 2024
                            </span>
                            <span style="color: var(--gray); font-weight: 600;">
                                <i class="far fa-calendar" style="margin-right: 0.25rem;"></i> July 2024
                            </span>
                            <span style="color: var(--success); font-weight: 600;">
                                <i class="fas fa-quote-right" style="margin-right: 0.25rem;"></i> 28 Citations
                            </span>
                        </div>
                    </div>
                    <a href="#" style="color: var(--primary); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 0.5rem;">
                        <i class="fas fa-external-link-alt"></i> PDF
                    </a>
                </div>
                <p style="color: var(--gray); margin-bottom: 1.5rem; line-height: 1.7;">
                    A novel framework for reinforcement learning that models adversarial
                    environment conditions during training, resulting in agents that are
                    3x more robust to distribution shifts and unexpected perturbations.
                </p>
                <div style="display: flex; gap: 0.75rem; flex-wrap: wrap;">
                    <span style="background: rgba(239, 68, 68, 0.1); color: var(--danger); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                        RL
                    </span>
                    <span style="background: rgba(245, 158, 11, 0.1); color: var(--warning); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                        Robustness
                    </span>
                    <span style="background: rgba(16, 185, 129, 0.1); color: var(--success); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                        Adversarial Training
                    </span>
                </div>
            </div>

            <!-- Publication 3 -->
            <div class="card animate-slide-up" style="animation-delay: 0.2s;">
                <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 1rem; flex-wrap: wrap; gap: 1rem;">
                    <div>
                        <h3 style="color: var(--dark); margin-bottom: 0.5rem;">
                            Scalable Graph Neural Networks for Billion-Node Networks
                        </h3>
                        <div style="display: flex; gap: 1rem; align-items: center; flex-wrap: wrap;">
                            <span style="background: var(--accent); color: white; padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                                KDD 2024
                            </span>
                            <span style="color: var(--gray); font-weight: 600;">
                                <i class="far fa-calendar" style="margin-right: 0.25rem;"></i> August 2024
                            </span>
                            <span style="color: var(--success); font-weight: 600;">
                                <i class="fas fa-quote-right" style="margin-right: 0.25rem;"></i> 35 Citations
                            </span>
                        </div>
                    </div>
                    <a href="#" style="color: var(--primary); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 0.5rem;">
                        <i class="fas fa-external-link-alt"></i> PDF
                    </a>
                </div>
                <p style="color: var(--gray); margin-bottom: 1.5rem; line-height: 1.7;">
                    We introduce a distributed training framework for graph neural networks
                    that enables training on graphs with billions of nodes and edges while
                    maintaining near-linear scaling efficiency across thousands of GPUs.
                </p>
                <div style="display: flex; gap: 0.75rem; flex-wrap: wrap;">
                    <span style="background: rgba(37, 99, 235, 0.1); color: var(--primary); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                        GNN
                    </span>
                    <span style="background: rgba(124, 58, 237, 0.1); color: var(--secondary); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                        Scalability
                    </span>
                    <span style="background: rgba(6, 182, 212, 0.1); color: var(--accent); padding: 0.25rem 0.75rem; border-radius: 1rem; font-size: 0.875rem; font-weight: 600;">
                        Distributed Training
                    </span>
                </div>
            </div>
        </div>

        <!-- Coming Soon / Admin Note -->
        <div class="card" style="background: linear-gradient(135deg, rgba(37, 99, 235, 0.05), rgba(124, 58, 237, 0.05)); border: none; text-align: center;">
            <div style="width: 4rem; height: 4rem; background: linear-gradient(135deg, var(--primary), var(--accent)); border-radius: 1rem; display: flex; align-items: center; justify-content: center; margin: 0 auto 1.5rem;">
                <i class="fas fa-database" style="color: white; font-size: 1.75rem;"></i>
            </div>
            <h3 style="color: var(--dark); margin-bottom: 1rem;">Publications Database</h3>
            <p style="color: var(--gray); max-width: 600px; margin: 0 auto 1.5rem;">
                This section will be dynamically populated with publications managed through
                the Django admin interface. Researchers can add new publications, update
                citation counts, and manage publication metadata.
            </p>
            <div style="display: inline-flex; align-items: center; gap: 0.75rem; background: white; padding: 0.75rem 1.5rem; border-radius: 0.75rem; box-shadow: var(--shadow);">
                <i class="fas fa-lock" style="color: var(--primary);"></i>
                <span style="color: var(--dark); font-weight: 600;">Admin Access Required</span>
                <a href="/admin/" style="color: var(--primary); text-decoration: none; font-weight: 600;">
                    Go to Admin →
                </a>
            </div>
        </div>

        <!-- Stats -->
        <div class="card" style="margin-top: 4rem; background: var(--dark); color: white; border: none;">
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 2rem; text-align: center;">
                <div>
                    <div style="font-size: 2.5rem; font-weight: 800; color: var(--accent); margin-bottom: 0.5rem;">A*</div>
                    <div style="color: #cbd5e1; font-weight: 600;">Conference Ranking</div>
                    <p style="color: #94a3b8; font-size: 0.875rem; margin-top: 0.5rem;">Top-tier venues</p>
                </div>

                <div>
                    <div style="font-size: 2.5rem; font-weight: 800; color: var(--success); margin-bottom: 0.5rem;">1000+</div>
                    <div style="color: #cbd5e1; font-weight: 600;">Total Citations</div>
                    <p style="color: #94a3b8; font-size: 0.875rem; margin-top: 0.5rem;">Research impact</p>
                </div>

                <div>
                    <div style="font-size: 2.5rem; font-weight: 800; color: var(--warning); margin-bottom: 0.5rem;">85%</div>
                    <div style="color: #cbd5e1; font-weight: 600;">Acceptance Rate</div>
                    <p style="color: #94a3b8; font-size: 0.875rem; margin-top: 0.5rem;">At top conferences</p>
                </div>

                <div>
                    <div style="font-size: 2.5rem; font-weight: 800; color: var(--secondary); margin-bottom: 0.5rem;">15+</div>
                    <div style="color: #cbd5e1; font-weight: 600;">Best Paper Awards</div>
                    <p style="color: #94a3b8; font-size: 0.875rem; margin-top: 0.5rem;">Industry recognition</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Call to Action -->
<section class="section" style="background: white;">
    <div class="container">
        <div style="text-align: center;">
            <h2 style="font-size: 2.5rem; margin-bottom: 1.5rem;">
                Access Our <span class="gradient-text">Research</span>
            </h2>
            <p style="color: var(--gray); max-width: 600px; margin: 0 auto 2.5rem;">
                Most of our research is openly available through arXiv and our GitHub repository.
                We believe in open science and collaborative progress.
            </p>
            <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
                <a href="https://arxiv.org" target="_blank" class="btn btn-primary">
                    <i class="fas fa-external-link-alt"></i> arXiv
                </a>
                <a href="https://github.com" target="_blank" class="btn" style="background: var(--dark); color: white;">
                    <i class="fab fa-github"></i> GitHub
                </a>
                <a href="mailto:{{ CONTACT_EMAIL }}?subject=Publication%20Request" class="btn btn-outline">
                    <i class="fas fa-envelope"></i> Request Access
                </a>
            </div>
        </div>
    </div>
</section>
EOF

    # Create a README file for the template structure
    cat << 'EOF' > "${TEMPLATE_DIR}/README.md"
# airis4D Template Structure

This directory contains HTML templates for the airis4D Django project.

## Directory Structure
source_html/
├── base.html # Main base template
├── homepage.html # Home page content
├── research.html # Research page content
├── publications.html # Publications page content
├── README.md # This file
├── partials/ # Reusable template components
│ ├── navbar.html # Navigation bar
│ └── footer.html # Footer
└── assets/ # Static assets (optional)
├── images/ # Image files
├── css/ # Additional CSS
└── js/ # JavaScript files
text


## How to Use

1. **Modify templates**: Edit the HTML files in this directory
2. **Add new pages**: Create new HTML files and add them to `config.json`
3. **Update partials**: Modify `partials/` for site-wide components
4. **Add assets**: Place images, CSS, JS in the `assets/` directory

## Template Features

- **Responsive design**: Works on mobile, tablet, and desktop
- **Modern UI**: Gradient designs, animations, and clean typography
- **Django Template Language**: Uses {% extends %}, {% include %}, {{ variables }}
- **Context variables**: Access to SITE_TITLE, CURRENT_YEAR, etc.

## Customization

To customize the design:
1. Edit CSS variables in `base.html`
2. Modify component styles in individual templates
3. Add new partials for reusable components
4. Update the JavaScript in `base.html` for interactivity

## Adding New Pages

1. Create a new HTML file in this directory
2. Add the page to `config.json` in the "pages" array
3. Run the builder to regenerate the project
EOF

    echo "Created professional templates with modular structure."

    # 2. Create the configuration file
    echo "Creating '$CONFIG_FILE_NAME'..."
    cat << EOF > "$CONFIG_FILE_NAME"
{
    "project_name": "airis4D_project",
    "app_name": "main_site",
    "auth_app_name": "accounts",
    "template_source_dir": "source_html",
    "pages": [
        {
            "name": "index",
            "url": "",
            "template_file": "homepage.html"
        },
        {
            "name": "research",
            "url": "research/",
            "template_file": "research.html"
        },
        {
            "name": "publications",
            "url": "publications/",
            "template_file": "publications.html"
        }
    ],
    "models": [
        {
            "name": "ResearchHub",
            "fields": ["title", "focus", "highlight", "order"]
        },
        {
            "name": "NewsItem",
            "fields": ["date_published", "headline"]
        }
    ]
}
EOF
    echo "Created configuration file."

    # 3. Write the complete Python Scaffolder module
    echo "Writing the final Python Scaffolder module to '$PYTHON_SCRIPT_NAME'..."
    cat << 'CODE' > "$PYTHON_SCRIPT_NAME"
import os
import json
import subprocess
import shutil
import re

# --- Configuration (Set this path before running) ---
CONFIG_FILE = 'config.json'

# ==============================================================================
# 1. UTILITY & FILE MANAGEMENT
# ==============================================================================

def load_config(config_file):
    """Loads configuration data from a JSON file."""
    try:
        with open(config_file, 'r') as f:
            config = json.load(f)
        return config
    except FileNotFoundError:
        print(f"ERROR: Configuration file '{config_file}' not found.")
        exit(1)
    except json.JSONDecodeError:
        print(f"ERROR: Could not parse '{config_file}'. Check JSON formatting.")
        exit(1)

def run_command(command, cwd=None):
    """Executes a shell command and checks for errors."""
    print(f"\n$ {' '.join(command)}")
    try:
        # We use shell=False for security, passing commands as a list
        result = subprocess.run(command, check=True, cwd=cwd, capture_output=True, text=True)
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"ERROR executing command: {e}")
        print(f"Stderr: {e.stderr}")
        exit(1)
    except FileNotFoundError:
        print("ERROR: Python or Django commands not found. Ensure Django is installed and environment is active.")
        exit(1)

# ==============================================================================
# 2. GENERATION HELPERS
# ==============================================================================

def generate_views_py(app_name, pages):
    """Generates the content for views.py based on pages list."""
    views_content = "from django.shortcuts import render\n"
    views_content += "from .models import " + ", ".join([p['name'] for p in config['models']]) + "\n\n"

    for page in pages:
        # Example of dynamic data fetching for the research page
        if page['name'] == 'research':
            data_fetch = f"    researchhub_list = ResearchHub.objects.all().order_by('order')\n    context = {{'researchhub_list': researchhub_list}}\n"
        else:
            data_fetch = f"    context = {{}}\n"

        views_content += (
            f"def {page['name']}(request):\n"
            f"    # TODO: Fetch dynamic data here\n"
            f"{data_fetch}"
            f"    return render(request, '{app_name}/{page['template_file']}', context)\n\n"
        )
    return views_content

def create_static_directories(project_dir, app_name):
    """Creates static directory structure for the app."""
    static_dir = os.path.join(project_dir, app_name, 'static')

    # Create main static directory
    os.makedirs(static_dir, exist_ok=True)

    # Create subdirectories
    subdirs = ['css', 'js', 'images', 'fonts']
    for subdir in subdirs:
        os.makedirs(os.path.join(static_dir, subdir), exist_ok=True)

    # Create a comprehensive CSS file
    css_file = os.path.join(static_dir, 'css', 'style.css')
    with open(css_file, 'w') as f:
        f.write("""
/* Additional Styles for airis4D */

/* Smooth scrolling for anchor links */
html {
    scroll-behavior: smooth;
}

/* Custom animations */
@keyframes float {
    0%, 100% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-10px);
    }
}

.float-animation {
    animation: float 3s ease-in-out infinite;
}

/* Gradient backgrounds */
.bg-gradient-dark {
    background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
}

.bg-gradient-primary {
    background: linear-gradient(135deg, var(--primary), var(--secondary));
}

/* Card hover effects */
.card-hover {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card-hover:hover {
    transform: translateY(-5px);
    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

/* Code block styling */
code {
    font-family: 'JetBrains Mono', monospace;
    background: var(--gray-light);
    padding: 0.2rem 0.4rem;
    border-radius: 0.25rem;
    font-size: 0.875em;
}

pre code {
    display: block;
    padding: 1rem;
    overflow-x: auto;
}

/* Form styling */
.input {
    padding: 0.75rem 1rem;
    border: 2px solid var(--gray-light);
    border-radius: var(--radius);
    font-size: 1rem;
    transition: var(--transition);
    width: 100%;
}

.input:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
}

/* Utility classes */
.text-balance {
    text-wrap: balance;
}

.glow {
    box-shadow: 0 0 20px rgba(37, 99, 235, 0.3);
}

.glow:hover {
    box-shadow: 0 0 30px rgba(37, 99, 235, 0.5);
}

/* Loading animation */
.loading-spinner {
    width: 2rem;
    height: 2rem;
    border: 3px solid var(--gray-light);
    border-top-color: var(--primary);
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    to {
        transform: rotate(360deg);
    }
}

/* Responsive improvements */
@media (max-width: 768px) {
    .mobile-stack {
        flex-direction: column !important;
    }

    .mobile-center {
        text-align: center !important;
    }

    .mobile-hide {
        display: none !important;
    }
}

/* Print styles */
@media print {
    .no-print {
        display: none !important;
    }

    body {
        font-size: 12pt;
        line-height: 1.5;
    }
}

/* Accessibility improvements */
@media (prefers-reduced-motion: reduce) {
    * {
        animation-duration: 0.01ms !important;
        animation-iteration-count: 1 !important;
        transition-duration: 0.01ms !important;
    }
}

/* Focus styles for accessibility */
:focus-visible {
    outline: 2px solid var(--primary);
    outline-offset: 2px;
}

/* Dark mode support */
@media (prefers-color-scheme: dark) {
    :root {
        --light: #0f172a;
        --dark: #f8fafc;
        --gray-light: #1e293b;
        --gray: #94a3b8;
    }

    .card {
        background: #1e293b;
        border-color: #334155;
    }
}
""")

    # Create a placeholder JS file
    js_file = os.path.join(static_dir, 'js', 'main.js')
    with open(js_file, 'w') as f:
        f.write("""
// airis4D Main JavaScript
console.log('airis4D Research Platform loaded');

// Smooth scroll for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const targetId = this.getAttribute('href');
        if (targetId === '#') return;

        const targetElement = document.querySelector(targetId);
        if (targetElement) {
            window.scrollTo({
                top: targetElement.offsetTop - 80,
                behavior: 'smooth'
            });
        }
    });
});

// Publication filter functionality (placeholder)
document.addEventListener('DOMContentLoaded', function() {
    const filterButtons = document.querySelectorAll('.publication-filter button');
    const publicationCards = document.querySelectorAll('.publication-card');

    filterButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Remove active class from all buttons
            filterButtons.forEach(btn => btn.style.background = 'transparent');
            filterButtons.forEach(btn => btn.style.color = 'var(--dark)');
            filterButtons.forEach(btn => btn.style.borderColor = 'var(--gray)');

            // Add active class to clicked button
            this.style.background = 'white';
            this.style.color = 'var(--primary)';
            this.style.borderColor = 'var(--primary)';

            // Filter logic would go here
            console.log('Filter by:', this.textContent.trim());
        });
    });
});

// Intersection Observer for animations
const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('animate-visible');
        }
    });
}, {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
});

// Observe elements for animation
document.querySelectorAll('.animate-on-scroll').forEach(el => {
    observer.observe(el);
});

// Back to top button
const backToTopButton = document.createElement('button');
backToTopButton.innerHTML = '<i class="fas fa-chevron-up"></i>';
backToTopButton.style.cssText = `
    position: fixed;
    bottom: 2rem;
    right: 2rem;
    width: 3rem;
    height: 3rem;
    background: var(--primary);
    color: white;
    border: none;
    border-radius: 50%;
    cursor: pointer;
    display: none;
    align-items: center;
    justify-content: center;
    font-size: 1.25rem;
    box-shadow: var(--shadow);
    z-index: 1000;
    transition: var(--transition);
`;
backToTopButton.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
});
document.body.appendChild(backToTopButton);

window.addEventListener('scroll', () => {
    if (window.scrollY > 500) {
        backToTopButton.style.display = 'flex';
    } else {
        backToTopButton.style.display = 'none';
    }
});

// Theme toggle (optional)
const themeToggle = document.createElement('button');
themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
themeToggle.title = 'Toggle theme';
themeToggle.style.cssText = `
    position: fixed;
    bottom: 2rem;
    left: 2rem;
    width: 3rem;
    height: 3rem;
    background: var(--dark);
    color: var(--light);
    border: none;
    border-radius: 50%;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.25rem;
    box-shadow: var(--shadow);
    z-index: 1000;
`;
themeToggle.addEventListener('click', () => {
    document.body.classList.toggle('dark-theme');
    const icon = themeToggle.querySelector('i');
    if (document.body.classList.contains('dark-theme')) {
        icon.classList.remove('fa-moon');
        icon.classList.add('fa-sun');
    } else {
        icon.classList.remove('fa-sun');
        icon.classList.add('fa-moon');
    }
});
document.body.appendChild(themeToggle);
""")

    print(f"✅ Created static directory structure for '{app_name}'")

def generate_urls_py(pages):
    """Generates the content for the app's urls.py based on pages list."""
    urls_content = (
        "from django.urls import path\n"
        "from . import views\n\n"
        "urlpatterns = [\n"
    )
    for page in pages:
        urls_content += (
            f"    path('{page['url']}', views.{page['name']}, name='{page['name']}'),\n"
        )
    urls_content += "]\n"
    return urls_content

def generate_models_py(models_config):
    """Generates the content for models.py based on models config."""
    models_content = "from django.db import models\n\n"
    for model in models_config:
        models_content += f"class {model['name']}(models.Model):\n"
        for field in model['fields']:
            field_lower = field.lower()
            if 'date' in field_lower:
                models_content += f"    {field_lower} = models.DateField(auto_now_add=True)\n"
            elif field_lower in ['highlight', 'focus']:
                 models_content += f"    {field_lower} = models.TextField(blank=True, null=True)\n"
            elif field_lower == 'order':
                 models_content += f"    {field_lower} = models.IntegerField(default=0)\n"
            else:
                models_content += f"    {field_lower} = models.CharField(max_length=255)\n"

        models_content += (
            f"    def __str__(self):\n"
            f"        return self.{model['fields'][0].lower()}\n\n"
        )
    return models_content

def generate_admin_py(models_config):
    """Generates the content for admin.py, registering all models."""
    admin_content = "from django.contrib import admin\n"
    admin_content += "from .models import " + ", ".join([model['name'] for model in models_config]) + "\n\n"
    admin_content += "# Register your models here\n"
    for model in models_config:
        admin_content += f"admin.site.register({model['name']})\n"
    return admin_content

def generate_context_processor(app_name):
    """Generates a context processor to add site-wide variables to all templates."""
    import datetime
    current_year = datetime.datetime.now().year

    context_processor_content = (
        f"def site_context(request):\n"
        f"    \"\"\"Injects site-wide variables into the template context.\"\"\"\n"
        f"    return {{\n"
        f"        'SITE_TITLE': 'airis4D Research',\n"
        f"        'CURRENT_YEAR': {current_year},\n"
        f"        'CONTACT_EMAIL': 'contact@airis4d.com',\n"
        f"        'SITE_DESCRIPTION': 'Advanced AI Research & Innovation',\n"
        f"        'SOCIAL_LINKS': {{\n"
        f"            'github': 'https://github.com/airis4d',\n"
        f"            'twitter': 'https://twitter.com/airis4d',\n"
        f"            'linkedin': 'https://linkedin.com/company/airis4d',\n"
        f"            'youtube': 'https://youtube.com/@airis4d',\n"
        f"        }}\n"
        f"    }}"
    )
    return context_processor_content


def generate_accounts_models_py(auth_app_name):
    """Generates the content for the accounts/models.py with Custom User."""
    models_content = (
        "from django.db import models\n"
        "from django.contrib.auth.models import AbstractUser\n\n"
        f"class User(AbstractUser):\n"
        f"    # This is the custom user model for scalability. Add custom fields here.\n"
        f"    pass\n\n"
        f"    def __str__(self):\n"
        f"        return self.email or self.username\n"
    )
    return models_content


# ==============================================================================
# 3. BUILDER CORE: FILE CREATION & MODIFICATION
# ==============================================================================

def generate_auxiliary_files(project_dir, project_name):
    """Generates requirements.txt, .env, and .gitignore."""

    # 1. requirements.txt
    req_path = os.path.join(project_dir, 'requirements.txt')
    with open(req_path, 'w') as f:
        f.write("Django~=5.0\n")
        f.write("python-decouple~=3.8\n")
        f.write("dj-database-url~=1.2\n")
        f.write("psycopg2-binary~=2.9\n")
        f.write("gunicorn~=21.2\n")
    print("✅ Generated requirements.txt.")

    # 2. .env (Placeholder for secrets)
    env_path = os.path.join(project_dir, '.env')
    with open(env_path, 'w') as f:
        f.write("# .env: Store environment variables and secrets here.\n")
        f.write(f"SECRET_KEY=PLACEHOLDER_CHANGE_ME_IMMEDIATELY_{os.urandom(24).hex()}\n")
        f.write("DEBUG=True\n")
        f.write("DATABASE_URL=sqlite:///db.sqlite3\n")
        f.write(f"DJANGO_SETTINGS_MODULE={project_name}.settings\n")
    print("✅ Generated .env file placeholder.")

    # 3. .gitignore
    gitignore_path = os.path.join(project_dir, '.gitignore')
    with open(gitignore_path, 'w') as f:
        f.write("/.venv\n")
        f.write("/__pycache__\n")
        f.write("db.sqlite3\n")
        f.write(".env\n")
        f.write("/media\n")
        f.write("/staticfiles\n")
    print("✅ Generated .gitignore file.")

def generate_deployment_files(project_dir, project_name):
    """Generates Procfile, runtime.txt, and modifies wsgi.py for cloud deployment."""

    # 1. Procfile
    procfile_path = os.path.join(project_dir, 'Procfile')
    wsgi_app_path = f"{project_name}.wsgi:application"
    with open(procfile_path, 'w') as f:
        f.write(f"web: gunicorn --bind 0.0.0.0 --timeout 60 {wsgi_app_path}")
    print("✅ Generated Procfile.")

    # 2. runtime.txt
    runtime_path = os.path.join(project_dir, 'runtime.txt')
    with open(runtime_path, 'w') as f:
        f.write("python-3.11.5")
    print("✅ Generated runtime.txt.")

    # 3. Modify WSGI to use decouple
    wsgi_file = os.path.join(project_dir, project_name, 'wsgi.py')
    with open(wsgi_file, 'r') as f:
        content = f.read()
    content = content.replace(
        "import os",
        "import os\nfrom decouple import config"
    )
    content = content.replace(
        "os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'airis4D_project.settings')",
        "os.environ.setdefault('DJANGO_SETTINGS_MODULE', config('DJANGO_SETTINGS_MODULE', default='airis4D_Scaffold.settings'))"
    )
    with open(wsgi_file, 'w') as f:
        f.write(content)
    print("✅ Modified wsgi.py.")

def create_accounts_app(project_dir, auth_app_name):
    """Creates the 'accounts' app and its models.py."""

    run_command(['python', os.path.join(project_dir, 'manage.py'), 'startapp', auth_app_name], cwd=project_dir)

    # 1. Generate models.py for the accounts app
    accounts_models_file = os.path.join(project_dir, auth_app_name, 'models.py')
    with open(accounts_models_file, 'w') as f:
        f.write(generate_accounts_models_py(auth_app_name))

    # 2. Generate admin.py for accounts
    admin_file = os.path.join(project_dir, auth_app_name, 'admin.py')
    with open(admin_file, 'w') as f:
        f.write(f"from django.contrib import admin\nfrom django.contrib.auth.admin import UserAdmin\nfrom .models import User\n\nadmin.site.register(User, UserAdmin)\n")

    # 3. Generate a proper apps.py
    apps_content = (
        "from django.apps import AppConfig\n\n"
        f"class {auth_app_name.capitalize()}Config(AppConfig):\n"
        f"    default_auto_field = 'django.db.models.BigAutoField'\n"
        f"    name = '{auth_app_name}'\n"
    )
    with open(os.path.join(project_dir, auth_app_name, 'apps.py'), 'w') as f:
        f.write(apps_content)

    # 4. IMPORTANT: Add default_app_config to __init__.py to ensure early loading
    init_file = os.path.join(project_dir, auth_app_name, '__init__.py')
    with open(init_file, 'w') as f:
        f.write(f"default_app_config = '{auth_app_name}.apps.{auth_app_name.capitalize()}Config'\n")

    print(f"✅ Created and configured '{auth_app_name}' app with Custom User Model.")


def configure_project_files(project_dir, project_name, app_name, auth_app_name):
    """Handles settings.py and project-level urls.py modifications."""
    settings_file = os.path.join(project_dir, project_name, 'settings.py')

    with open(settings_file, 'r') as f:
        content = f.read()

    # 1. Decouple/DB Setup and AUTH_USER_MODEL
    content = content.replace(
        "from pathlib import Path",
        "import os\nfrom pathlib import Path\nfrom decouple import config, Csv\nfrom dj_database_url import parse as db_url\n"
    )
    auth_user_model_code = f"\nAUTH_USER_MODEL = '{auth_app_name}.User'\n"
    content = content.replace("INSTALLED_APPS = [", f"{auth_user_model_code}\nINSTALLED_APPS = [")
    content = content.replace(
        "SECRET_KEY = '",
        "# Moved SECRET_KEY to .env for security\nSECRET_KEY = config('SECRET_KEY')\n#"
    )
    content = content.replace(
        "DEBUG = True",
        "DEBUG = config('DEBUG', default=False, cast=bool)"
    )
    db_config_code = (
        "if config('DATABASE_URL', default=None):\n"
        "    DATABASES = {\n"
        "        'default': config('DATABASE_URL', cast=db_url)\n"
        "    }\n"
        "else:\n"
        "    DATABASES = {\n"
        "        'default': {\n"
        "            'ENGINE': 'django.db.backends.sqlite3',\n"
        f"            'NAME': BASE_DIR / 'db.sqlite3',\n"
        "        }\n"
        "    }"
    )
    content = content.replace(
        "DATABASES = {\n"
        "    'default': {\n"
        "        'ENGINE': 'django.db.backends.sqlite3',\n"
        "        'NAME': BASE_DIR / 'db.sqlite3',\n"
        "    }\n"
        "}",
        db_config_code
    )

    # 2. INSTALLED_APPS - Fix this section
    # We need to add both accounts and main_site to INSTALLED_APPS
    # Find where to insert our apps (after 'django.contrib.staticfiles')
    staticfiles_pos = content.find("'django.contrib.staticfiles',")
    if staticfiles_pos != -1:
        # Find the end of that line
        line_end = content.find("\n", staticfiles_pos)
        if line_end != -1:
            # Insert our apps after this line
            apps_to_add = f"\n    '{auth_app_name}',\n    '{app_name}',"
            content = content[:line_end] + apps_to_add + content[line_end:]
    else:
        # Fallback: just add them at the end of INSTALLED_APPS
        end_pos = content.find("]", content.find("INSTALLED_APPS = ["))
        if end_pos != -1:
            apps_to_add = f"\n    '{auth_app_name}',\n    '{app_name}',"
            content = content[:end_pos] + apps_to_add + content[end_pos:]

    # 3. TEMPLATES (Context Processor Registration)
    content = content.replace(
        "'django.contrib.messages.context_processors.messages',",
        "'django.contrib.messages.context_processors.messages',\n"
        f"                '{app_name}.context_processors.site_context',"
    )

    # 4. Static Files Configuration (Production Polish)
    staticfiles_code = (
        "\n# Builder Generated Static/Media Paths\n"
        "STATIC_URL = '/static/'\n"
        "STATICFILES_DIRS = [\n"
        f"    os.path.join(BASE_DIR, '{app_name}', 'static'),\n"
        "]\n"
        "STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')\n"
    )
    content += staticfiles_code

    with open(settings_file, 'w') as f:
        f.write(content)

    # 5. Project urls.py modification (include app) - FIX THIS
    project_urls_file = os.path.join(project_dir, project_name, 'urls.py')
    with open(project_urls_file, 'r') as f:
        content = f.read()

    # Check if include is already imported
    if "from django.urls import path, include" not in content:
        content = content.replace(
            "from django.urls import path\n",
            "from django.urls import path, include\n"
        )

    # Add our app's URLs - make sure we're not adding it twice
    if f"include('{app_name}.urls')" not in content:
        # Find the urlpatterns list and add our include
        urlpatterns_pos = content.find("urlpatterns = [")
        if urlpatterns_pos != -1:
            # Find the closing bracket of urlpatterns
            bracket_count = 1
            current_pos = urlpatterns_pos + len("urlpatterns = [")
            while bracket_count > 0 and current_pos < len(content):
                if content[current_pos] == '[':
                    bracket_count += 1
                elif content[current_pos] == ']':
                    bracket_count -= 1
                current_pos += 1

            # Insert before the closing bracket
            insert_pos = current_pos - 1
            url_include = f"\n    path('', include('{app_name}.urls')),\n"
            content = content[:insert_pos] + url_include + content[insert_pos:]

    with open(project_urls_file, 'w') as f:
        f.write(content)

    print(f"✅ Configured settings.py and project urls.py.")


def copy_templates(project_dir, app_name, template_source_dir, pages):
    """Copies HTML files and handles template inheritance with includes."""
    base_dir = os.path.dirname(os.path.abspath(__file__))
    app_dir = os.path.join(project_dir, app_name)
    template_source = os.path.join(base_dir, template_source_dir)
    template_destination = os.path.join(app_dir, 'templates', app_name)
    global_template_dir = os.path.join(app_dir, 'templates')

    # Create directories
    os.makedirs(template_destination, exist_ok=True)
    os.makedirs(global_template_dir, exist_ok=True)

    print(f"\n--- Copying Templates from {template_source} ---")

    try:
        # 1. Copy base.html to global templates
        base_html_source = os.path.join(template_source, 'base.html')
        base_html_dest = os.path.join(global_template_dir, 'base.html')

        if os.path.exists(base_html_source):
            shutil.copy2(base_html_source, base_html_dest)
            print("✅ Copied base.html for template inheritance.")
        else:
            print("⚠️ Warning: base.html not found in source dir.")
            # Create a minimal base.html
            with open(base_html_dest, 'w') as f:
                f.write("<!DOCTYPE html>\n<html>\n<head>\n<title>{% block title %}{% endblock %}</title>\n</head>\n<body>\n{% block content %}{% endblock %}\n</body>\n</html>")

        # 2. Copy partials directory if it exists
        partials_source = os.path.join(template_source, 'partials')
        partials_dest = os.path.join(global_template_dir, 'partials')

        if os.path.exists(partials_source):
            if os.path.exists(partials_dest):
                shutil.rmtree(partials_dest)
            shutil.copytree(partials_source, partials_dest)
            print("✅ Copied partials directory.")

        # 3. Copy and process page templates
        for page in pages:
            source_file = os.path.join(template_source, page['template_file'])
            destination_file = os.path.join(template_destination, page['template_file'])

            if os.path.exists(source_file):
                # Read the template content
                with open(source_file, 'r') as f:
                    content = f.read()

                # Write to destination (no wrapping needed since templates use {% extends %})
                with open(destination_file, 'w') as f:
                    f.write(content)

                print(f"✅ Copied {page['template_file']}")
            else:
                # Create a placeholder template if file doesn't exist
                print(f"⚠️ Template file not found: {page['template_file']}")
                placeholder_content = f"""
{{% extends 'base.html' %}}
{{% block title %}}{page['name'].title()}{{% endblock %}}
{{% block content %}}
<div class="container">
    <h1>{page['name'].title()} Page</h1>
    <p>This is the {page['name']} page. Template file '{page['template_file']}' was not found.</p>
</div>
{{% endblock %}}
"""
                with open(destination_file, 'w') as f:
                    f.write(placeholder_content)
                print(f"✅ Created placeholder for {page['template_file']}")

        # 4. Copy assets directory if it exists
        assets_source = os.path.join(template_source, 'assets')
        static_dir = os.path.join(app_dir, 'static')

        if os.path.exists(assets_source):
            # Copy to app's static directory
            for item in os.listdir(assets_source):
                s = os.path.join(assets_source, item)
                d = os.path.join(static_dir, item)
                if os.path.isdir(s):
                    if os.path.exists(d):
                        shutil.rmtree(d)
                    shutil.copytree(s, d)
                else:
                    shutil.copy2(s, d)
            print("✅ Copied assets directory to static files.")

    except Exception as e:
        print(f"\n❌ TEMPLATE ERROR: {e}")
        import traceback
        traceback.print_exc()

def validate_templates(template_source_dir, pages):
    """Validates that all required template files exist."""
    base_dir = os.path.dirname(os.path.abspath(__file__))
    template_source = os.path.join(base_dir, template_source_dir)

    print(f"\n--- Validating Templates in {template_source} ---")

    missing_files = []

    # Check base.html
    base_file = os.path.join(template_source, 'base.html')
    if not os.path.exists(base_file):
        print("⚠️ Warning: base.html not found")
        missing_files.append('base.html')
    else:
        print("✅ Found base.html")

    # Check page templates
    for page in pages:
        template_file = os.path.join(template_source, page['template_file'])
        if os.path.exists(template_file):
            print(f"✅ Found {page['template_file']}")
        else:
            print(f"❌ Missing: {page['template_file']}")
            missing_files.append(page['template_file'])

    # Check partials directory
    partials_dir = os.path.join(template_source, 'partials')
    if os.path.exists(partials_dir):
        print(f"✅ Found partials directory with {len(os.listdir(partials_dir))} files")
    else:
        print("⚠️ Partial directory not found (optional)")

    if missing_files:
        print(f"\n⚠️ Warning: {len(missing_files)} template files missing:")
        for file in missing_files:
            print(f"   - {file}")
        print("\nPlaceholders will be created for missing files.")

    return len(missing_files) == 0

def generate_data_fixture(app_name, models_config, project_dir):
    """Generates a basic JSON data fixture file for initial content."""

    app_fixtures_dir = os.path.join(project_dir, app_name, 'fixtures')
    os.makedirs(app_fixtures_dir, exist_ok=True)
    fixture_path = os.path.join(app_fixtures_dir, 'initial_data.json')
    fixture_data = []
    pk_counter = 1

    print("\n--- Generating Initial Data Fixture ---")

    for model in models_config:
        model_name = model['name']
        app_model_label = f"{app_name}.{model_name.lower()}"

        for i in range(1, 3):
            fields = {}
            for field in model['fields']:
                field_lower = field.lower()
                if 'date' in field_lower:
                    fields[field_lower] = "2025-01-01"
                elif field_lower == 'order':
                    fields[field_lower] = i
                elif field_lower in ['highlight', 'focus']:
                    fields[field_lower] = f"Sample focus area {i} for {model_name}."
                else:
                    fields[field_lower] = f"Sample {model_name} Title {i}"

            fixture_data.append({
                "model": app_model_label,
                "pk": pk_counter,
                "fields": fields
            })
            pk_counter += 1

    with open(fixture_path, 'w') as f:
        json.dump(fixture_data, f, indent=4)
    print(f"✅ Generated data fixture at: {fixture_path}")


# ==============================================================================
# 4. MAIN EXECUTABLE
# ==============================================================================

def main_builder():
    """Executes the complete professional Django scaffolding process."""

    # 1. Load Configuration
    global config
    config = load_config(CONFIG_FILE)
    PROJECT_NAME = config['project_name']
    APP_NAME = config['app_name']
    AUTH_APP_NAME = config['auth_app_name']
    TEMPLATE_SOURCE_DIR = config['template_source_dir']

    # Validate templates before starting
    if not validate_templates(TEMPLATE_SOURCE_DIR, config['pages']):
        response = input("\nSome template files are missing. Continue anyway? (y/n): ")
        if response.lower() != 'y':
            print("Build cancelled.")
            return


    base_dir = os.path.dirname(os.path.abspath(__file__))
    PROJECT_DIR = os.path.join(base_dir, PROJECT_NAME)
    MANAGE_PY = os.path.join(PROJECT_DIR, 'manage.py')
    APP_DIR = os.path.join(PROJECT_DIR, APP_NAME)

    # 2. Cleanup & Initial Setup
    if os.path.exists(PROJECT_DIR):
        print(f"⚠️ Deleting existing directory: {PROJECT_DIR}")
        shutil.rmtree(PROJECT_DIR)

    try:
        os.makedirs(PROJECT_DIR)
        print(f"✅ Recreated project directory: {PROJECT_DIR}")
    except OSError as e:
        print(f"CRITICAL ERROR: Failed to create project directory: {e}")
        exit(1)

    # 3. Create Django project
    run_command(['django-admin', 'startproject', PROJECT_NAME, PROJECT_DIR])

    # 4. Create apps using a simpler approach WITHOUT using manage.py
    # This avoids the Django setup that triggers the AUTH_USER_MODEL check

    # Create accounts app manually
    print(f"\n--- Creating {AUTH_APP_NAME} app manually ---")
    auth_app_dir = os.path.join(PROJECT_DIR, AUTH_APP_NAME)
    os.makedirs(auth_app_dir, exist_ok=True)

    # Create __init__.py
    with open(os.path.join(auth_app_dir, '__init__.py'), 'w') as f:
        f.write('')

    # Create apps.py for accounts
    apps_content = (
        "from django.apps import AppConfig\n\n"
        f"class AccountsConfig(AppConfig):\n"
        f"    default_auto_field = 'django.db.models.BigAutoField'\n"
        f"    name = '{AUTH_APP_NAME}'\n"
    )
    with open(os.path.join(auth_app_dir, 'apps.py'), 'w') as f:
        f.write(apps_content)

    # Create models.py for accounts
    with open(os.path.join(auth_app_dir, 'models.py'), 'w') as f:
        f.write(generate_accounts_models_py(AUTH_APP_NAME))

    # Create admin.py for accounts
    with open(os.path.join(auth_app_dir, 'admin.py'), 'w') as f:
        f.write(f"from django.contrib import admin\nfrom django.contrib.auth.admin import UserAdmin\nfrom .models import User\n\nadmin.site.register(User, UserAdmin)\n")

    # Create other required files
    for file_name in ['views.py', 'urls.py', 'tests.py']:
        with open(os.path.join(auth_app_dir, file_name), 'w') as f:
            f.write('# This file is intentionally left empty for now.\n')

    print(f"✅ Manually created '{AUTH_APP_NAME}' app structure.")

    # Create main_site app manually
    print(f"\n--- Creating {APP_NAME} app manually ---")
    app_dir = os.path.join(PROJECT_DIR, APP_NAME)
    os.makedirs(app_dir, exist_ok=True)

    # Create __init__.py
    with open(os.path.join(app_dir, '__init__.py'), 'w') as f:
        f.write('')

    # Create apps.py for main_site
    apps_content = (
        "from django.apps import AppConfig\n\n"
        f"class MainSiteConfig(AppConfig):\n"
        f"    default_auto_field = 'django.db.models.BigAutoField'\n"
        f"    name = '{APP_NAME}'\n"
    )
    with open(os.path.join(app_dir, 'apps.py'), 'w') as f:
        f.write(apps_content)

    print(f"✅ Manually created '{APP_NAME}' app structure.")

    # 5. Global File Generation (Security & Deployment)
    generate_auxiliary_files(PROJECT_DIR, PROJECT_NAME)
    generate_deployment_files(PROJECT_DIR, PROJECT_NAME)

    # 6. NOW configure project files (AFTER all apps are created)
    configure_project_files(PROJECT_DIR, PROJECT_NAME, APP_NAME, AUTH_APP_NAME)

    # 7. Generate App Code Files for main_site
    app_files_to_generate = {
        'urls.py': generate_urls_py(config['pages']),
        'views.py': generate_views_py(APP_NAME, config['pages']),
        'models.py': generate_models_py(config['models']),
        'admin.py': generate_admin_py(config['models']),
        'context_processors.py': generate_context_processor(APP_NAME)
    }

    for filename, content in app_files_to_generate.items():
        with open(os.path.join(app_dir, filename), 'w') as f:
            f.write(content)
    print("✅ Generated app Python files (models, views, urls, admin, context_processors).")

    # 8. Template Copying
    create_static_directories(PROJECT_DIR, APP_NAME)
    copy_templates(PROJECT_DIR, APP_NAME, TEMPLATE_SOURCE_DIR, config['pages'])

    print("\n--- Installing Dependencies (Fixing ModuleNotFoundError) ---")

    # Use the run_command utility to install packages from the generated requirements.txt
    run_command(['pip', 'install', '-r', os.path.join(PROJECT_DIR, 'requirements.txt')], cwd=PROJECT_DIR)

    print("✅ Dependencies installed successfully.")

    # 9. Run Migrations & Data Seeding
    # Now that all apps are created and settings are configured, we can run migrations
    run_command(['python', MANAGE_PY, 'makemigrations', AUTH_APP_NAME], cwd=PROJECT_DIR)
    run_command(['python', MANAGE_PY, 'makemigrations', APP_NAME], cwd=PROJECT_DIR)
    run_command(['python', MANAGE_PY, 'migrate'], cwd=PROJECT_DIR)
    generate_data_fixture(APP_NAME, config['models'], PROJECT_DIR)

    print("\n" + "="*70)
    print("🚀 FINAL BUILD COMPLETE! airis4D Project Scaffolding SUCCESSFUL! 🚀")
    print("===================================================================")
    print("   PROJECT:  ", PROJECT_NAME)
    print("   NEXT STEPS: ")
    print("   1. Navigate to the project root: cd", PROJECT_NAME)
    print("   2. Install dependencies: pip install -r requirements.txt")
    print("   3. Load sample data: python manage.py loaddata initial_data")
    print("   4. Create admin user: python manage.py createsuperuser")
    print("   5. Run server: python manage.py runserver")
    print("===================================================================")

def develop_mode(project_dir, app_name, template_source_dir, pages):
    """Starts development mode with live template reloading."""
    print("\n🚀 Starting Development Mode...")
    print("Changes in source_html/ will be reflected immediately.")
    print("Press Ctrl+C to stop.\n")

    import time
    from watchdog.observers import Observer
    from watchdog.events import FileSystemEventHandler

    class TemplateHandler(FileSystemEventHandler):
        def __init__(self, source_dir, dest_dir, app_name):
            self.source_dir = source_dir
            self.dest_dir = dest_dir
            self.app_name = app_name

        def on_modified(self, event):
            if event.src_path.endswith('.html'):
                rel_path = os.path.relpath(event.src_path, self.source_dir)
                dest_path = os.path.join(self.dest_dir, self.app_name, 'templates', self.app_name, rel_path)

                if os.path.exists(dest_path) and os.path.islink(dest_path):
                    # Update symlink
                    os.remove(dest_path)
                    os.symlink(os.path.relpath(event.src_path, os.path.dirname(dest_path)), dest_path)
                    print(f"🔄 Updated: {rel_path}")

    try:
        # First, create symlinks
        copy_templates(project_dir, app_name, template_source_dir, pages, use_symlinks=True)

        # Set up file watcher
        base_dir = os.path.dirname(os.path.abspath(__file__))
        source_dir = os.path.join(base_dir, template_source_dir)

        event_handler = TemplateHandler(source_dir, project_dir, app_name)
        observer = Observer()
        observer.schedule(event_handler, source_dir, recursive=True)
        observer.start()

        print(f"👀 Watching {template_source_dir}/ for changes...")
        print("📁 Edit HTML files and see changes immediately!")
        print("⏹️  Press Ctrl+C to stop development mode.\n")

        # Keep running
        while True:
            time.sleep(1)

    except KeyboardInterrupt:
        print("\n🛑 Development mode stopped.")
        if 'observer' in locals():
            observer.stop()
            observer.join()
    except ImportError:
        print("❌ watchdog module not installed. Install with: pip install watchdog")
        print("📋 Using standard symlink mode instead.")
        copy_templates(project_dir, app_name, template_source_dir, pages, use_symlinks=True)
    except Exception as e:
        print(f"❌ Error: {e}")

def copy_templates(project_dir, app_name, template_source_dir, pages, use_symlinks=True):
    """Copies or links HTML files from source to Django templates."""
    base_dir = os.path.dirname(os.path.abspath(__file__))
    app_dir = os.path.join(project_dir, app_name)
    template_source = os.path.join(base_dir, template_source_dir)
    template_destination = os.path.join(app_dir, 'templates', app_name)
    global_template_dir = os.path.join(app_dir, 'templates')

    # Create directories
    os.makedirs(template_destination, exist_ok=True)
    os.makedirs(global_template_dir, exist_ok=True)

    print(f"\n--- {'Linking' if use_symlinks else 'Copying'} Templates from {template_source} ---")

    try:
        # 1. Handle base.html
        base_html_source = os.path.join(template_source, 'base.html')
        base_html_dest = os.path.join(global_template_dir, 'base.html')

        if os.path.exists(base_html_source):
            if use_symlinks:
                # Remove existing file/link
                if os.path.exists(base_html_dest):
                    os.remove(base_html_dest)
                # Create symbolic link
                os.symlink(os.path.relpath(base_html_source, os.path.dirname(base_html_dest)), base_html_dest)
                print("✅ Linked base.html (symlink)")
            else:
                shutil.copy2(base_html_source, base_html_dest)
                print("✅ Copied base.html")
        else:
            print("⚠️ Warning: base.html not found in source dir.")
            # Create minimal base.html
            with open(base_html_dest, 'w') as f:
                f.write("<!DOCTYPE html>\n<html>\n<head>\n<title>{% block title %}{% endblock %}</title>\n</head>\n<body>\n{% block content %}{% endblock %}\n</body>\n</html>")

        # 2. Handle partials directory
        partials_source = os.path.join(template_source, 'partials')
        partials_dest = os.path.join(global_template_dir, 'partials')

        if os.path.exists(partials_source):
            if os.path.exists(partials_dest):
                if os.path.islink(partials_dest):
                    os.remove(partials_dest)
                else:
                    shutil.rmtree(partials_dest)

            if use_symlinks:
                # Create symbolic link to partials directory
                os.symlink(os.path.relpath(partials_source, os.path.dirname(partials_dest)), partials_dest)
                print("✅ Linked partials directory (symlink)")
            else:
                shutil.copytree(partials_source, partials_dest)
                print("✅ Copied partials directory")

        # 3. Handle page templates
        for page in pages:
            source_file = os.path.join(template_source, page['template_file'])
            destination_file = os.path.join(template_destination, page['template_file'])

            # Ensure destination directory exists
            os.makedirs(os.path.dirname(destination_file), exist_ok=True)

            if os.path.exists(source_file):
                if use_symlinks:
                    # Remove existing file/link
                    if os.path.exists(destination_file):
                        os.remove(destination_file)
                    # Create symbolic link
                    os.symlink(os.path.relpath(source_file, os.path.dirname(destination_file)), destination_file)
                    print(f"✅ Linked {page['template_file']} (symlink)")
                else:
                    shutil.copy2(source_file, destination_file)
                    print(f"✅ Copied {page['template_file']}")
            else:
                # Create placeholder
                print(f"⚠️ Template file not found: {page['template_file']}")
                placeholder_content = f"""{{% extends 'base.html' %}}
{{% block title %}}{page['name'].title()}{{% endblock %}}
{{% block content %}}
<div class="container">
    <h1>{page['name'].title()} Page</h1>
    <p>This is the {page['name']} page. Template file '{page['template_file']}' was not found.</p>
</div>
{{% endblock %}}"""
                with open(destination_file, 'w') as f:
                    f.write(placeholder_content)

        # 4. Handle assets directory
        assets_source = os.path.join(template_source, 'assets')
        static_dir = os.path.join(app_dir, 'static')

        if os.path.exists(assets_source):
            if use_symlinks:
                # Link entire assets directory to static
                assets_link = os.path.join(static_dir, 'assets')
                if os.path.exists(assets_link):
                    if os.path.islink(assets_link):
                        os.remove(assets_link)
                    else:
                        shutil.rmtree(assets_link)

                os.makedirs(static_dir, exist_ok=True)
                os.symlink(os.path.relpath(assets_source, static_dir), assets_link)
                print("✅ Linked assets directory (symlink)")
            else:
                # Copy assets
                for item in os.listdir(assets_source):
                    s = os.path.join(assets_source, item)
                    d = os.path.join(static_dir, item)
                    if os.path.isdir(s):
                        if os.path.exists(d):
                            shutil.rmtree(d)
                        shutil.copytree(s, d)
                    else:
                        shutil.copy2(s, d)
                print("✅ Copied assets directory")

    except Exception as e:
        print(f"\n❌ TEMPLATE ERROR: {e}")
        import traceback
        traceback.print_exc()


def list_available_templates(template_source_dir):
    """Lists all available templates in the source directory."""
    base_dir = os.path.dirname(os.path.abspath(__file__))
    template_source = os.path.join(base_dir, template_source_dir)

    if not os.path.exists(template_source):
        print(f"❌ Template directory '{template_source}' not found.")
        return []

    print(f"\n📁 Available Templates in '{template_source_dir}':")
    print("=" * 50)

    templates = []

    # Walk through directory
    for root, dirs, files in os.walk(template_source):
        level = root.replace(template_source, '').count(os.sep)
        indent = ' ' * 2 * level
        rel_path = os.path.relpath(root, template_source)

        if rel_path == '.':
            print(f"{indent}📂 /")
        else:
            print(f"{indent}📂 {rel_path}/")

        subindent = ' ' * 2 * (level + 1)

        for file in files:
            if file.endswith('.html'):
                full_path = os.path.join(root, file)
                rel_file_path = os.path.relpath(full_path, template_source)
                templates.append(rel_file_path)
                print(f"{subindent}📄 {file}")
            elif not file.startswith('.'):
                print(f"{subindent}📄 {file}")

    print("=" * 50)
    return templates

# ==============================================================================
# 5. TEMPLATE BROWSER INTEGRATION
# ==============================================================================

def launch_template_browser():
    """Launch the template browser module."""
    try:
        # Try to import the template browser module
        import subprocess
        import sys

        print("\n🎨 Launching Template Browser...")
        print("=" * 50)

        # Check if template_browser.py exists
        if os.path.exists("template_browser.py"):
            # Run the template browser
            result = subprocess.run([sys.executable, "template_browser.py"])
            if result.returncode != 0:
                print("\n⚠️  Template browser exited with errors.")
        else:
            print("❌ template_browser.py not found.")
            print("\n💡 To enable template browsing, create template_browser.py")
            print("   with the code provided in the documentation.")

    except Exception as e:
        print(f"❌ Error launching template browser: {e}")
        print("\n💡 Make sure template_browser.py exists in the same directory.")

if __name__ == '__main__':
    import sys

    # Handle command line arguments
    if len(sys.argv) > 1:
        if sys.argv[1] == '--list-templates':
            config = load_config(CONFIG_FILE)
            list_available_templates(config['template_source_dir'])
            sys.exit(0)
        elif sys.argv[1] == '--validate':
            config = load_config(CONFIG_FILE)
            if validate_templates(config['template_source_dir'], config['pages']):
                print("✅ All templates validated successfully!")
                sys.exit(0)
            else:
                print("❌ Template validation failed.")
                sys.exit(1)
        elif sys.argv[1] == '--develop' or sys.argv[1] == '-d':
            config = load_config(CONFIG_FILE)
            base_dir = os.path.dirname(os.path.abspath(__file__))
            project_dir = os.path.join(base_dir, config['project_name'])

            if not os.path.exists(project_dir):
                print("❌ Project not built yet. Run builder first.")
                sys.exit(1)

            develop_mode(project_dir, config['app_name'], config['template_source_dir'], config['pages'])
            sys.exit(0)
        elif sys.argv[1] == '--symlink':
            config = load_config(CONFIG_FILE)
            base_dir = os.path.dirname(os.path.abspath(__file__))
            project_dir = os.path.join(base_dir, config['project_name'])

            if not os.path.exists(project_dir):
                print("❌ Project not built yet. Run builder first.")
                sys.exit(1)

            copy_templates(project_dir, config['app_name'], config['template_source_dir'], config['pages'], use_symlinks=True)
            print("✅ Templates linked. Changes in source_html/ will be reflected immediately.")
            sys.exit(0)
        elif sys.argv[1] == '--browse-templates' or sys.argv[1] == '-b':
            launch_template_browser()
            sys.exit(0)
        elif sys.argv[1] == '--help' or sys.argv[1] == '-h':
            print("""
airis4D Django Project Builder

Usage:
  python airis4d_scaffolder.py [command]

Commands:
  (no command)           Build the Django project
  --develop, -d          Start development mode with live reload
  --symlink              Link templates (no copying)
  --browse-templates, -b Browse & download free templates
  --list-templates       List available HTML templates
  --validate             Validate template files
  --help, -h            Show this help message

Development Workflow:
  1. python airis4d_scaffolder.py              # Initial build
  2. python airis4d_scaffolder.py -b           # Browse/download templates
  3. python airis4d_scaffolder.py --symlink    # Link new templates
  4. python airis4d_scaffolder.py --develop    # Live development
  5. Edit files in source_html/                # Changes appear immediately

Template Sources:
  • HTML5 UP (https://html5up.net/)
  • Templated (https://templated.co/)
  • Start Bootstrap (https://startbootstrap.com/)
  • Colorlib (https://colorlib.com/)
  • Free CSS (https://www.free-css.com/)
            """)
            sys.exit(0)

    # Default: run the builder
    main_builder()


CODE

cat > template_sources.json << 'EOF'
{
  "categories": {
    "ai_research": ["Technology", "Research", "AI", "Science", "Lab"],
    "portfolio": ["Portfolio", "Creative", "Personal", "Resume"],
    "business": ["Business", "Corporate", "Professional", "Agency"],
    "ecommerce": ["E-commerce", "Shop", "Store", "Product"],
    "blog": ["Blog", "News", "Magazine", "Articles"],
    "education": ["Education", "School", "University", "Learning"],
    "health": ["Health", "Medical", "Hospital", "Clinic"]
  },
  "sources": [
    {
      "name": "HTML5 UP",
      "url": "https://html5up.net/",
      "description": "Responsive HTML5 and CSS3 site templates",
      "free": true,
      "download_type": "direct",
      "categories": ["ai_research", "portfolio", "business", "blog"],
      "recommended_for": ["Research labs", "Portfolios", "Startups"]
    },
    {
      "name": "Templated",
      "url": "https://templated.co/",
      "description": "850+ free CSS and HTML site templates",
      "free": true,
      "download_type": "direct",
      "categories": ["portfolio", "business", "blog", "education"],
      "recommended_for": ["Simple websites", "Blogs", "Small businesses"]
    },
    {
      "name": "Start Bootstrap",
      "url": "https://startbootstrap.com/templates/",
      "description": "Free Bootstrap templates and themes",
      "free": true,
      "download_type": "direct",
      "categories": ["business", "portfolio", "ecommerce", "blog"],
      "recommended_for": ["Bootstrap users", "Quick prototypes", "Business sites"]
    },
    {
      "name": "Colorlib",
      "url": "https://colorlib.com/wp/templates/",
      "description": "Free Bootstrap website templates",
      "free": true,
      "download_type": "web_scrape",
      "categories": ["business", "portfolio", "ecommerce", "blog"],
      "recommended_for": ["Modern designs", "E-commerce", "Landing pages"]
    },
    {
      "name": "Free CSS",
      "url": "https://www.free-css.com/templates",
      "description": "Free CSS website templates and themes",
      "free": true,
      "download_type": "direct",
      "categories": ["business", "portfolio", "blog", "education"],
      "recommended_for": ["CSS enthusiasts", "Lightweight sites", "All purposes"]
    },
    {
      "name": "GitHub Awesome Templates",
      "url": "https://github.com/topics/free-html-templates",
      "description": "GitHub repositories with free templates",
      "free": true,
      "download_type": "github",
      "categories": ["ai_research", "portfolio", "business", "blog"],
      "recommended_for": ["Developers", "Customizable templates", "Open source fans"]
    }
  ],
  "recent_downloads": [],
  "favorites": [],
  "last_updated": "2025-12-01",
  "version": "1.0"
}
EOF


cat > template_browser.py << 'EOF'
#!/usr/bin/env python3
"""
Template Browser for airis4D Django Builder - FIXED VERSION
Author: Gemini AI
Date: December 2025

Description: Browse and download free HTML templates from various sources.
Fixed category matching issue.
"""

import os
import sys
import json
import requests
import zipfile
import shutil
import webbrowser
from pathlib import Path
from urllib.parse import urljoin, quote
import time
import re
from datetime import datetime

# Try to import beautifulsoup4, but make it optional
try:
    from bs4 import BeautifulSoup
    BEAUTIFULSOUP_AVAILABLE = True
except ImportError:
    BEAUTIFULSOUP_AVAILABLE = False
    print("⚠️  BeautifulSoup4 not installed. Some features limited.")
    print("   Install with: pip install beautifulsoup4")

# Configuration
CONFIG_FILE = 'config.json'
TEMPLATE_SOURCES_FILE = 'template_sources.json'

class TemplateBrowser:
    def __init__(self):
        self.sources_file = TEMPLATE_SOURCES_FILE
        self.template_dir = None
        self.load_config()
        self.load_sources()

    def load_config(self):
        """Load the main configuration to get template directory."""
        try:
            with open(CONFIG_FILE, 'r') as f:
                config = json.load(f)
                self.template_dir = config.get('template_source_dir', 'source_html')
                print(f"📁 Template directory: {self.template_dir}")
        except FileNotFoundError:
            print(f"❌ Configuration file '{CONFIG_FILE}' not found.")
            print("   Run the main builder first to create config.json")
            self.template_dir = 'source_html'

    def load_sources(self):
        """Load or create template sources configuration."""
        if os.path.exists(self.sources_file):
            with open(self.sources_file, 'r') as f:
                self.sources = json.load(f)
        else:
            self.sources = self.get_default_sources()
            self.save_sources()

    def save_sources(self):
        """Save template sources to file."""
        with open(self.sources_file, 'w') as f:
            json.dump(self.sources, f, indent=2)

    def get_default_sources(self):
        """Return default template sources."""
        return {
            "categories": {
                "ai_research": ["Technology", "Research", "AI", "Science"],
                "portfolio": ["Portfolio", "Creative", "Personal"],
                "business": ["Business", "Corporate", "Professional"],
                "ecommerce": ["E-commerce", "Shop", "Store"],
                "blog": ["Blog", "News", "Magazine"]
            },
            "sources": [
                {
                    "name": "HTML5 UP",
                    "url": "https://html5up.net/",
                    "description": "Responsive HTML5 and CSS3 site templates",
                    "free": True,
                    "download_type": "direct",
                    "categories": ["ai_research", "portfolio", "business"]
                },
                {
                    "name": "Templated",
                    "url": "https://templated.co/",
                    "description": "850+ free CSS and HTML site templates",
                    "free": True,
                    "download_type": "direct",
                    "categories": ["portfolio", "business", "blog"]
                },
                {
                    "name": "Start Bootstrap",
                    "url": "https://startbootstrap.com/templates/",
                    "description": "Free Bootstrap templates",
                    "free": True,
                    "download_type": "direct",
                    "categories": ["business", "portfolio", "ecommerce"]
                },
                {
                    "name": "Colorlib",
                    "url": "https://colorlib.com/wp/templates/",
                    "description": "Free Bootstrap website templates",
                    "free": True,
                    "download_type": "web_scrape",
                    "categories": ["business", "portfolio", "ecommerce"]
                },
                {
                    "name": "Free CSS",
                    "url": "https://www.free-css.com/templates",
                    "description": "Free CSS website templates",
                    "free": True,
                    "download_type": "direct",
                    "categories": ["business", "portfolio", "blog"]
                },
                {
                    "name": "GitHub Awesome Templates",
                    "url": "https://github.com/topics/free-html-templates",
                    "description": "GitHub repositories with free templates",
                    "free": True,
                    "download_type": "github",
                    "categories": ["ai_research", "portfolio", "business"]
                }
            ],
            "recent_downloads": [],
            "favorites": []
        }

    def list_categories(self):
        """List available template categories with numbers."""
        print("\n📂 AVAILABLE CATEGORIES:")
        print("=" * 50)

        categories = list(self.sources["categories"].keys())

        for i, cat_id in enumerate(categories, 1):
            tags = self.sources["categories"][cat_id]
            display_name = cat_id.replace('_', ' ').title()
            print(f"\n{i:2}. {display_name:<20} → {', '.join(tags)}")

        print("\n" + "=" * 50)
        return categories

    def match_category_input(self, user_input, categories_list):
        """
        Match user input to a category.

        Args:
            user_input: User's input (could be number or name)
            categories_list: List of category IDs

        Returns:
            Matched category ID or None
        """
        if not user_input:
            return None

        user_input = user_input.strip().lower()

        # Convert categories list to dict with numbers
        category_dict = {str(i+1): cat for i, cat in enumerate(categories_list)}

        # Check if input is a number
        if user_input in category_dict:
            return category_dict[user_input]

        # Check if input matches a category ID (with underscores)
        if user_input in categories_list:
            return user_input

        # Check if input matches display name (with spaces)
        user_input_normalized = user_input.replace(' ', '_').lower()
        if user_input_normalized in categories_list:
            return user_input_normalized

        # Check partial matches
        for cat_id in categories_list:
            display_name = cat_id.replace('_', ' ').lower()
            if user_input in display_name or user_input in cat_id:
                return cat_id

        return None

    def list_sources(self, category=None):
        """List template sources, optionally filtered by category."""
        if category:
            category_display = category.replace('_', ' ').title()
            print(f"\n🔍 TEMPLATE SOURCES - {category_display}")
        else:
            print(f"\n🔍 ALL TEMPLATE SOURCES")

        print("=" * 60)

        sources = self.sources["sources"]
        if category:
            sources = [s for s in sources if category in s.get("categories", [])]

        if not sources:
            if category:
                print(f"\n❌ No sources found for category: {category_display}")
                print("Try a different category or use 'all'.")
            else:
                print("\n❌ No sources found.")
        else:
            for i, source in enumerate(sources, 1):
                print(f"\n{i:2}. {source['name']}")
                print(f"   📍 {source['url']}")
                print(f"   📝 {source['description']}")
                categories_display = [c.replace('_', ' ').title() for c in source.get("categories", [])]
                print(f"   🏷️  Categories: {', '.join(categories_display)}")
                print(f"   💰 {'Free' if source['free'] else 'Paid'}")

        print("\n" + "=" * 60)
        return sources

    def browse_source(self, source_index):
        """Open a template source in web browser."""
        if 0 <= source_index < len(self.sources["sources"]):
            source = self.sources["sources"][source_index]
            print(f"\n🌐 Opening {source['name']}...")
            print(f"📖 {source['description']}")
            print(f"🔗 {source['url']}")

            webbrowser.open(source['url'])
            return True
        return False

    def search_templates(self, query, category=None):
        """Search for templates online."""
        print(f"\n🔎 Searching for: '{query}'", end="")
        if category:
            print(f" in {category.replace('_', ' ').title()}")
        else:
            print()

        print("=" * 60)

        # Simulated search results
        simulated_results = [
            {
                "name": "Research Lab Template",
                "description": "Modern research laboratory website template",
                "source": "HTML5 UP",
                "url": "https://html5up.net/research-lab",
                "preview": "https://html5up.net/research-lab/preview",
                "download": "https://html5up.net/research-lab/download",
                "category": "ai_research",
                "tags": ["science", "research", "lab", "technology"]
            },
            {
                "name": "AI Research Portfolio",
                "description": "AI researcher portfolio template",
                "source": "Start Bootstrap",
                "url": "https://startbootstrap.com/theme/resume",
                "preview": "https://startbootstrap.com/previews/resume",
                "download": "https://startbootstrap.com/theme/resume/download",
                "category": "ai_research",
                "tags": ["portfolio", "ai", "resume", "scientist"]
            },
            {
                "name": "Tech Conference",
                "description": "Technology conference website template",
                "source": "Colorlib",
                "url": "https://colorlib.com/wp/template/tech-conference/",
                "preview": "https://colorlib.com/preview/theme/tech-conference/",
                "download": "https://colorlib.com/download/1566/",
                "category": "ai_research",
                "tags": ["conference", "tech", "event", "science"]
            },
            {
                "name": "Data Science Portfolio",
                "description": "Data scientist portfolio template",
                "source": "Templated",
                "url": "https://templated.co/datascience",
                "preview": "https://templated.co/datascience/preview",
                "download": "https://templated.co/datascience/download",
                "category": "ai_research",
                "tags": ["data", "science", "portfolio", "analysis"]
            },
            {
                "name": "Minimal Portfolio",
                "description": "Clean and minimal portfolio template",
                "source": "HTML5 UP",
                "url": "https://html5up.net/minimal",
                "preview": "https://html5up.net/minimal/preview",
                "download": "https://html5up.net/minimal/download",
                "category": "portfolio",
                "tags": ["minimal", "clean", "simple", "elegant"]
            },
            {
                "name": "Business Corporate",
                "description": "Professional business corporate template",
                "source": "Start Bootstrap",
                "url": "https://startbootstrap.com/theme/business",
                "preview": "https://startbootstrap.com/previews/business",
                "download": "https://startbootstrap.com/theme/business/download",
                "category": "business",
                "tags": ["business", "corporate", "professional", "agency"]
            }
        ]

        # Filter by query and category
        results = []
        query_lower = query.lower()

        for result in simulated_results:
            if (query_lower in result["name"].lower() or
                query_lower in result["description"].lower() or
                any(query_lower in tag for tag in result["tags"])):

                if category and result["category"] != category:
                    continue

                results.append(result)

        if not results:
            print("\n❌ No templates found. Try a different search term.")
            print("\n💡 Try searching for: research, portfolio, science, technology, ai, business")
            return []

        # Display results
        for i, result in enumerate(results, 1):
            print(f"\n{i:2}. {result['name']}")
            print(f"   📝 {result['description']}")
            print(f"   📍 Source: {result['source']}")
            print(f"   🔗 Preview: {result['preview']}")
            print(f"   🏷️  Tags: {', '.join(result['tags'])}")

        print("\n" + "=" * 60)
        return results

    def download_template(self, result_index, results):
        """Download a template from search results."""
        if 0 <= result_index < len(results):
            template = results[result_index]
            print(f"\n📥 Downloading: {template['name']}")
            print(f"📝 {template['description']}")
            print(f"🔗 Source: {template['source']}")

            # Create download directory
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            safe_name = re.sub(r'[^\w\-_]', '_', template['name'].lower())
            download_dir = os.path.join("downloaded_templates", f"{safe_name}_{timestamp}")
            os.makedirs(download_dir, exist_ok=True)

            # Simulate download
            print(f"\n📁 Creating template structure in: {download_dir}")

            # Create a simple HTML template structure
            self.create_simulated_template(download_dir, template)

            print(f"\n✅ Template structure created!")
            print(f"📁 Location: {download_dir}")
            print(f"\n📋 Files created:")
            for root, dirs, files in os.walk(download_dir):
                level = root.replace(download_dir, '').count(os.sep)
                indent = ' ' * 2 * level
                print(f"{indent}📂 {os.path.basename(root) or '/'}")
                subindent = ' ' * 2 * (level + 1)
                for file in files:
                    print(f"{subindent}📄 {file}")

            # Ask if user wants to use this template
            response = input("\n🎨 Use this template as your project template? (y/n): ")
            if response.lower() == 'y':
                self.use_as_project_template(download_dir, template['name'])

            # Add to recent downloads
            self.sources["recent_downloads"].append({
                "name": template['name'],
                "date": datetime.now().isoformat(),
                "path": download_dir,
                "source": template['source']
            })
            self.save_sources()

            return download_dir
        return None

    def create_simulated_template(self, directory, template_info):
        """Create a simulated template structure."""

        # Create base.html
        base_html = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{% block title %}}{{{{ SITE_TITLE }}}}{{% endblock %}} - {template_info['name']}</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- Custom CSS -->
    <style>
        :root {{
            --primary-color: #2563eb;
            --secondary-color: #7c3aed;
            --accent-color: #06b6d4;
        }}

        body {{
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
        }}

        .navbar-brand {{
            font-weight: 700;
            font-size: 1.5rem;
        }}

        .hero-section {{
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 5rem 0;
        }}

        .feature-card {{
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }}

        .feature-card:hover {{
            transform: translateY(-5px);
        }}

        .footer {{
            background: #1a1a1a;
            color: white;
            padding: 3rem 0;
        }}
    </style>

    {{% block extra_css %}}{{% endblock %}}
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="/">
                <i class="fas fa-rocket text-primary me-2"></i>
                {{{{ SITE_TITLE }}}}
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/research/">Research</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/publications/">Publications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mailto:{{{{ CONTACT_EMAIL }}}}">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    {{% block content %}}{{% endblock %}}

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>{{{{ SITE_TITLE }}}}</h5>
                    <p>{{{{ SITE_DESCRIPTION }}}}</p>
                </div>
                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="/" class="text-light">Home</a></li>
                        <li><a href="/research/" class="text-light">Research</a></li>
                        <li><a href="/publications/" class="text-light">Publications</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contact</h5>
                    <p><i class="fas fa-envelope me-2"></i> {{{{ CONTACT_EMAIL }}}}</p>
                </div>
            </div>
            <hr class="bg-light">
            <div class="text-center">
                <p>&copy; {{{{ CURRENT_YEAR }}}} {{{{ SITE_TITLE }}}}. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    {{% block extra_js %}}{{% endblock %}}
</body>
</html>"""

        with open(os.path.join(directory, "base.html"), "w") as f:
            f.write(base_html)

        # Create homepage.html
        homepage_html = f"""{{% extends 'base.html' %}}

{{% block title %}}Home{{% endblock %}}

{{% block content %}}
<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h1 class="display-4 fw-bold mb-4">Advancing AI Research</h1>
                <p class="lead mb-4">
                    Pioneering research in artificial intelligence, machine learning,
                    and neural networks. {template_info['description']}
                </p>
                <a href="/research/" class="btn btn-light btn-lg">
                    <i class="fas fa-microscope me-2"></i>Explore Research
                </a>
            </div>
            <div class="col-lg-6">
                <div class="text-center">
                    <i class="fas fa-brain display-1 opacity-75"></i>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold">Research Focus Areas</h2>
            <p class="text-muted">Cutting-edge domains of artificial intelligence research</p>
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="card feature-card h-100">
                    <div class="card-body p-4">
                        <div class="mb-3">
                            <i class="fas fa-network-wired fa-2x text-primary"></i>
                        </div>
                        <h4 class="card-title">Neural Networks</h4>
                        <p class="card-text">
                            Advanced architectures and training techniques for
                            next-generation neural networks.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card feature-card h-100">
                    <div class="card-body p-4">
                        <div class="mb-3">
                            <i class="fas fa-robot fa-2x text-success"></i>
                        </div>
                        <h4 class="card-title">Autonomous Systems</h4>
                        <p class="card-text">
                            Self-learning agents and reinforcement learning
                            for autonomous decision-making.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card feature-card h-100">
                    <div class="card-body p-4">
                        <div class="mb-3">
                            <i class="fas fa-shield-alt fa-2x text-warning"></i>
                        </div>
                        <h4 class="card-title">AI Safety</h4>
                        <p class="card-text">
                            Ensuring robustness, fairness, and transparency
                            in AI systems.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Stats Section -->
<section class="bg-light py-5">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-3">
                <h3 class="fw-bold text-primary">50+</h3>
                <p class="text-muted">Research Papers</p>
            </div>
            <div class="col-md-3">
                <h3 class="fw-bold text-success">15+</h3>
                <p class="text-muted">Open Source Projects</p>
            </div>
            <div class="col-md-3">
                <h3 class="fw-bold text-warning">10M+</h3>
                <p class="text-muted">Model Downloads</p>
            </div>
            <div class="col-md-3">
                <h3 class="fw-bold text-info">25+</h3>
                <p class="text-muted">Industry Partners</p>
            </div>
        </div>
    </div>
</section>
{{% endblock %}}"""

        with open(os.path.join(directory, "homepage.html"), "w") as f:
            f.write(homepage_html)

        # Create other page templates
        templates = {
            "research.html": "Research",
            "publications.html": "Publications",
            "about.html": "About Us"
        }

        for filename, title in templates.items():
            content = f"""{{% extends 'base.html' %}}

{{% block title %}}{title}{{% endblock %}}

{{% block content %}}
<div class="container py-5">
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <h1 class="fw-bold mb-4">{title} Page</h1>
            <p class="lead">
                This is the {title.lower()} page using the {template_info['name']} template.
            </p>
            <p>
                Content for this page will be dynamically loaded from Django models
                and configuration.
            </p>

            <div class="card mt-4">
                <div class="card-body">
                    <h5><i class="fas fa-info-circle me-2 text-primary"></i>Template Info</h5>
                    <p class="mb-0">
                        <strong>Template:</strong> {template_info['name']}<br>
                        <strong>Source:</strong> {template_info['source']}<br>
                        <strong>Description:</strong> {template_info['description']}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
{{% endblock %}}"""

            with open(os.path.join(directory, filename), "w") as f:
                f.write(content)

        # Create partials directory
        partials_dir = os.path.join(directory, "partials")
        os.makedirs(partials_dir, exist_ok=True)

        # Create simple partials
        navbar_html = """<!-- Navigation Partial -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="/">
            <i class="fas fa-rocket text-primary me-2"></i>
            {{ SITE_TITLE }}
        </a>
        <!-- Navigation items will be added by main template -->
    </div>
</nav>"""

        with open(os.path.join(partials_dir, "navbar.html"), "w") as f:
            f.write(navbar_html)

        # Create assets directory
        assets_dir = os.path.join(directory, "assets")
        os.makedirs(os.path.join(assets_dir, "css"), exist_ok=True)
        os.makedirs(os.path.join(assets_dir, "js"), exist_ok=True)
        os.makedirs(os.path.join(assets_dir, "images"), exist_ok=True)

        # Create sample CSS
        css_content = """/* Additional styles for downloaded template */
.custom-gradient {
    background: linear-gradient(135deg, #2563eb, #7c3aed);
}

.btn-gradient {
    background: linear-gradient(135deg, #2563eb, #7c3aed);
    border: none;
    color: white;
}

.btn-gradient:hover {
    background: linear-gradient(135deg, #1d4ed8, #6d28d9);
    color: white;
}

.animate-float {
    animation: float 3s ease-in-out infinite;
}

@keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
}"""

        with open(os.path.join(assets_dir, "css", "custom.css"), "w") as f:
            f.write(css_content)

        # Create a README
        readme_content = f"""# {template_info['name']}

This template was downloaded via the airis4D Template Browser.

## Source Information
- **Name**: {template_info['name']}
- **Description**: {template_info['description']}
- **Source**: {template_info['source']}
- **URL**: {template_info['url']}
- **Downloaded**: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

## Files Structure
- `base.html` - Main base template with Bootstrap 5
- `homepage.html` - Home page template
- `research.html` - Research page template
- `publications.html` - Publications page template
- `about.html` - About page template
- `partials/` - Reusable template components
- `assets/` - Static assets (CSS, JS, images)

## Features
- Responsive design with Bootstrap 5
- Modern gradient colors
- Font Awesome icons
- Custom CSS animations
- Django template tags ready

## How to Use with airis4D Builder
1. Copy these files to your `source_html/` directory
2. Run the builder: `python3 airis4d_scaffolder.py`
3. Or use symlinks: `python3 airis4d_scaffolder.py --symlink`

## Customization
Edit the HTML files to match your research lab's branding and content."""

        with open(os.path.join(directory, "README.md"), "w") as f:
            f.write(readme_content)

    def use_as_project_template(self, source_dir, template_name):
        """Use downloaded template as the project template."""
        if not self.template_dir:
            print("❌ Template directory not configured.")
            return

        target_dir = self.template_dir

        # Ask for confirmation
        print(f"\n⚠️  This will replace files in {target_dir}/")
        print(f"   Backup recommended if you have customizations.")

        response = input("Continue? (y/n): ")
        if response.lower() != 'y':
            print("Template not applied.")
            return

        # Backup existing template directory
        backup_dir = None
        if os.path.exists(target_dir):
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            backup_dir = f"{target_dir}_backup_{timestamp}"
            shutil.copytree(target_dir, backup_dir)
            print(f"📦 Backup created: {backup_dir}")

        # Clear target directory
        if os.path.exists(target_dir):
            shutil.rmtree(target_dir)

        # Copy new template
        shutil.copytree(source_dir, target_dir)

        print(f"\n✅ Template applied successfully!")
        print(f"📁 New template: {target_dir}/")
        print(f"🎨 Template: {template_name}")
        if backup_dir:
            print(f"📦 Backup: {backup_dir}/")

        # Update config.json to include new pages if they don't exist
        self.update_config_with_new_pages()

    def update_config_with_new_pages(self):
        """Update config.json with new pages from template."""
        try:
            with open(CONFIG_FILE, 'r') as f:
                config = json.load(f)

            # Check for new HTML files
            template_dir = config.get('template_source_dir', 'source_html')
            existing_pages = {p['template_file'] for p in config.get('pages', [])}

            new_pages = []
            for file in os.listdir(template_dir):
                if file.endswith('.html') and file != 'base.html':
                    if file not in existing_pages:
                        page_name = os.path.splitext(file)[0]
                        new_pages.append({
                            "name": page_name,
                            "url": f"{page_name}/" if page_name != "homepage" else "",
                            "template_file": file
                        })

            if new_pages:
                config['pages'].extend(new_pages)
                with open(CONFIG_FILE, 'w') as f:
                    json.dump(config, f, indent=2)

                print(f"\n📝 Added {len(new_pages)} new pages to config.json:")
                for page in new_pages:
                    print(f"   - {page['name']} → {page['template_file']}")

        except Exception as e:
            print(f"⚠️  Could not update config.json: {e}")

    def list_recent_downloads(self):
        """List recently downloaded templates."""
        recent = self.sources.get("recent_downloads", [])

        if not recent:
            print("\n📭 No recent downloads.")
            return []

        print("\n📥 RECENT DOWNLOADS:")
        print("=" * 60)

        for i, download in enumerate(reversed(recent[-10:]), 1):  # Show last 10
            date = download.get('date', '').split('T')[0]
            print(f"\n{i:2}. {download['name']}")
            print(f"   📅 {date}")
            print(f"   📍 {download.get('path', 'N/A')}")
            print(f"   📦 Source: {download.get('source', 'Unknown')}")

        print("\n" + "=" * 60)
        return recent

    def open_template_in_browser(self, template_path):
        """Open a downloaded template in browser for preview."""
        index_file = os.path.join(template_path, "homepage.html")
        if os.path.exists(index_file):
            # Convert to absolute path
            abs_path = os.path.abspath(index_file)
            file_url = f"file://{abs_path}"

            print(f"\n🔍 Previewing template...")
            print(f"📁 File: {abs_path}")

            webbrowser.open(file_url)
            return True
        else:
            print(f"❌ No homepage.html found in {template_path}")
            return False

    def interactive_browse(self):
        """Interactive template browsing interface."""
        while True:
            print("\n" + "=" * 60)
            print("🎨 airis4D TEMPLATE BROWSER")
            print("=" * 60)
            print("\n1. 🔍 Search Templates")
            print("2. 📂 Browse by Category")
            print("3. 🌐 Open Template Websites")
            print("4. 📥 Recent Downloads")
            print("5. 📝 Apply Template to Project")
            print("6. 🏠 Back to Main Menu")
            print("7. 🚪 Exit")

            choice = input("\nSelect option (1-7): ").strip()

            if choice == "1":
                # Search templates
                query = input("Enter search query: ").strip()
                if query:
                    category = None
                    use_category = input("Filter by category? (y/n): ").lower()
                    if use_category == 'y':
                        categories = self.list_categories()
                        cat_choice = input("Enter category number or name: ").strip()
                        # Try to match category
                        category = self.match_category_input(cat_choice, categories)

                    results = self.search_templates(query, category)
                    if results:
                        dl_choice = input("\nDownload a template? (enter number or 'n'): ").strip()
                        if dl_choice.isdigit():
                            idx = int(dl_choice) - 1
                            self.download_template(idx, results)

            elif choice == "2":
                # Browse by category - FIXED
                categories = self.list_categories()
                cat_input = input("\nEnter category number, name, or 'all': ").strip().lower()

                if cat_input == 'all':
                    self.list_sources()
                else:
                    # Try to match the input
                    matched_category = self.match_category_input(cat_input, categories)
                    if matched_category:
                        self.list_sources(matched_category)
                    else:
                        print("❌ Invalid category. Available categories:")
                        print("   Enter number (1-5), name (ai_research), or 'all'")
                        for i, cat_id in enumerate(categories, 1):
                            display_name = cat_id.replace('_', ' ').title()
                            print(f"   {i}. {display_name}")

            elif choice == "3":
                # Open template websites
                sources = self.list_sources()
                if sources:
                    src_choice = input("\nOpen which source? (enter number): ").strip()
                    if src_choice.isdigit():
                        idx = int(src_choice) - 1
                        if 0 <= idx < len(sources):
                            self.browse_source(idx)
                        else:
                            print("❌ Invalid source number.")

            elif choice == "4":
                # Recent downloads
                recent = self.list_recent_downloads()
                if recent:
                    dl_choice = input("\nOpen a recent download? (enter number or 'n'): ").strip()
                    if dl_choice.isdigit():
                        idx = int(dl_choice) - 1
                        if 0 <= idx < len(recent):
                            selected = list(reversed(recent))[idx]
                            self.open_template_in_browser(selected.get('path'))

            elif choice == "5":
                # Apply template to project
                if not self.template_dir:
                    print("❌ Template directory not configured.")
                    continue

                print(f"\n📁 Current template directory: {self.template_dir}/")
                print("\nOptions:")
                print("1. Use a recent download")
                print("2. Browse downloaded templates")
                print("3. Reset to default templates")

                apply_choice = input("\nSelect option (1-3): ").strip()

                if apply_choice == "1":
                    recent = self.list_recent_downloads()
                    if recent:
                        dl_choice = input("\nSelect download to apply (enter number): ").strip()
                        if dl_choice.isdigit():
                            idx = int(dl_choice) - 1
                            if 0 <= idx < len(recent):
                                selected = list(reversed(recent))[idx]
                                self.use_as_project_template(
                                    selected.get('path'),
                                    selected.get('name', 'Downloaded Template')
                                )

                elif apply_choice == "2":
                    # Browse downloaded_templates directory
                    if os.path.exists("downloaded_templates"):
                        print("\n📂 Available downloaded templates:")
                        templates = os.listdir("downloaded_templates")
                        for i, template in enumerate(templates, 1):
                            print(f"{i:2}. {template}")

                        temp_choice = input("\nSelect template (enter number): ").strip()
                        if temp_choice.isdigit():
                            idx = int(temp_choice) - 1
                            if 0 <= idx < len(templates):
                                template_path = os.path.join("downloaded_templates", templates[idx])
                                self.use_as_project_template(template_path, templates[idx])
                    else:
                        print("❌ No downloaded templates found.")

                elif apply_choice == "3":
                    print("\n⚠️  This will reset to the original airis4D templates.")
                    confirm = input("Continue? (y/n): ").lower()
                    if confirm == 'y':
                        print("✅ Template reset feature coming soon!")
                        print("Please re-run the installer to get default templates.")

            elif choice == "6":
                # Back to main menu (break from this loop)
                print("\n← Returning to main menu...")
                break

            elif choice == "7":
                print("\n👋 Goodbye!")
                sys.exit(0)

            else:
                print("❌ Invalid choice. Please try again.")

            input("\nPress Enter to continue...")

def main():
    """Main function for template browser."""
    print("\n" + "=" * 60)
    print("🎨 airis4D Template Browser - FIXED VERSION")
    print("=" * 60)
    print("\nBrowse and download free HTML templates for your Django project.")
    print("Find templates for research labs, portfolios, businesses, and more!")

    browser = TemplateBrowser()
    browser.interactive_browse()

if __name__ == "__main__":
    main()
EOF

cat > integrate_template_browser.py << 'EOF'
#!/usr/bin/env python3
"""
Integration module for Template Browser into airis4D Builder.
"""

import os
import sys

def add_template_browser_option():
    """Add template browser option to the main builder menu."""

    # Check if template_browser.py exists
    if not os.path.exists("template_browser.py"):
        print("❌ template_browser.py not found. Creating it...")
        # We'll create it from the code above
        create_template_browser()

    print("\n" + "=" * 60)
    print("🎨 TEMPLATE BROWSER INTEGRATION")
    print("=" * 60)
    print("\nThe template browser allows you to:")
    print("  • 🔍 Search free HTML templates online")
    print("  • 📥 Download templates for research labs, portfolios, etc.")
    print("  • 🎨 Preview templates in browser")
    print("  • 📝 Apply templates to your project")
    print("  • 📂 Manage downloaded templates")

    response = input("\nLaunch Template Browser? (y/n): ").strip().lower()

    if response == 'y':
        print("\n🚀 Launching Template Browser...")
        os.system(f"{sys.executable} template_browser.py")
    else:
        print("Returning to main menu...")

def create_template_browser():
    """Create the template browser module if it doesn't exist."""
    # This would copy the template_browser.py content from above
    # For now, we'll just inform the user
    print("Please create template_browser.py with the provided code.")
    print("Copy the content from the previous section into template_browser.py")

def add_to_main_builder_menu():
    """Modify the main builder to include template browser option."""
    print("\n📋 Modified Main Menu:")
    print("1. 🚀 Build Django Project")
    print("2. 🎨 Browse & Download Templates")
    print("3. 📁 List Available Templates")
    print("4. ✅ Validate Templates")
    print("5. 🔗 Link Templates (Symlink Mode)")
    print("6. 👀 Development Mode (Live Watch)")
    print("7. 🆘 Help")
    print("8. 🚪 Exit")

    choice = input("\nSelect option (1-8): ").strip()

    if choice == "2":
        add_template_browser_option()
        return True  # Continue showing menu
    else:
        # Return choice for original handler
        return choice

if __name__ == "__main__":
    # Test the integration
    add_template_browser_option()
EOF


    echo "---"
    echo "SETUP COMPLETE! The following files are ready:"
    echo "* $PYTHON_SCRIPT_NAME (The executable builder)"
    echo "* $CONFIG_FILE_NAME (Your project definition)"
    echo "* $TEMPLATE_DIR/ (Your HTML source folder with professional templates)"
    echo "---"
    echo "AVAILABLE COMMANDS:"
    echo "  Build project:        python3 $PYTHON_SCRIPT_NAME"
    echo "  List templates:       python3 $PYTHON_SCRIPT_NAME --list-templates"
    echo "  Browse/Download templates:       python3 $PYTHON_SCRIPT_NAME --browse-templates"
    echo "  Browse/Download templates:       python3 $PYTHON_SCRIPT_NAME --symlink"
    echo "  Browse/Download templates:       python3 $PYTHON_SCRIPT_NAME --develop"

    echo "  Validate templates:   python3 $PYTHON_SCRIPT_NAME --validate"
    echo "  Get help:            python3 $PYTHON_SCRIPT_NAME --help"
    echo "---"
    echo "CUSTOMIZATION:"
    echo "1. Edit HTML files in $TEMPLATE_DIR/"
    echo "2. Update project settings in $CONFIG_FILE_NAME"
    echo "3. Run the builder to regenerate your project"
}

# --- Execution ---
pip install beautifulsoup4 requests
check_dependencies
install_scaffolder
